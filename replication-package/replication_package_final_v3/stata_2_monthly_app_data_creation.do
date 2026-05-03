
clear
set more off

cd "$P_Main/monthly_app_data_csv"

capture erase "$P_Data_Processed/monthly_app_data.dta"

set more off

clear

local m = 12
local y = 2014

local i = 1

while `y' > 2011 {

while `m' >0 {

clear

if `m'<10 {
insheet using "monthlydata_`y'_0`m'_26.csv"
}
if `m'>=10 {
insheet using "monthlydata_`y'_`m'_26.csv"
}

		rename v1 name
		rename v2 category
		rename v3 price
		rename v4 size	
		rename v5 developer
		drop v6
		drop v7
		drop v8
		rename v9 download
		rename v10  update_str
		if `y'==2014 & `m'>4 {
			rename v11 type
		}
		if `y'==2014 & `m'==4 {
			drop v11
		}
		
		gener update_date = date(update_str, "MDY")
		 
		drop update_str


		gener paid = (price!="Free")
			
		replace price = "0" if price=="Free"
		replace price = subinstr(price, "$","",.)
		destring price, replace force
		
		*** SIZE ***

		drop size

		
		
		*** DOWNLOADS **
		
		split download, p(" - ")
		replace download1 = subinstr(download1, ",","",.)
		replace download2 = subinstr(download2, ",","",.)

		replace download1 = "0" if download1==""
		replace download2 = "0" if download2==""
		replace download1 = "0" if download1=="None"

		destring download1, replace force
		destring download2, replace force


		drop download
		rename download1 min_download
		rename download2 max_download
		
		gener month =`m'
		gener year = `y'
	
		if `i'>1 {
			append using "$P_Data_Processed/monthly_app_data.dta"	
		}
		save "$P_Data_Processed/monthly_app_data.dta", replace
		
	local i = `i'+1
	local m = `m'-1
}

local y = `y'-1
local m = 12
}

compress
save "$P_Data_Processed/monthly_app_data.dta", replace

* generating game dummy 
gener game = 0 

replace game = 1 if category=="Action" | category=="Adventure" | category=="Arcade" | category=="Arcade & Action" | category=="Board" | category=="Brain & Puzzle" | category=="Card" | category=="Cards & Casino" | category=="Casino" | category=="Casual" | category=="Educational" | category=="Family" | category=="Music" | category=="Puzzle" | category=="Racing" | category=="Role Playing" | category=="Simulation" | category=="Sports Games" | category=="Strategy" | category=="Trivia" | category=="Word"

replace game = 1 if type=="GAME"

drop type 

gegen max_game = max(game), by(name)

** dealing with sports games -> for March and April 2014, a bug in AppMonsta's raw data resulted in both Sports and Sports Games having "Sports" as their category. Need to sort out the two. 
replace game = . if category=="Sports" & year==2014 & (month==3 | month==4)

* first, dealing with sports/ sports game apps that are observed pre March/April 2014 and post March/April 2014
replace game = 1 if category=="Sports" & year==2014 & (month==3 | month==4) & max_game==1 
replace game = 0 if category=="Sports" & year==2014 & (month==3 | month==4) & max_game==0
replace category = "Sports Games" if category=="Sports" & year==2014 & (month==3 | month==4) & max_game==1
drop max_game 
save "$P_Data_Processed/monthly_app_data.dta", replace

* keeping set of apps in May 2014
preserve 
	
	keep if month==5 & year==2014 
	keep name game
	save "$P_Data_Processed/name_game_05_2014.dta", replace 

restore 

* keeping only sports/sports game apps that are only observed in march and april 2014
keep if year==2014
gegen min_month = min(month), by(name)
gegen max_month = max(month), by(name)
keep if month==3 | month==4 
keep if category=="Sports" 
keep if min_month==3 | min_month==4
keep if max_month==3 | max_month==4 
drop min_month 
drop max_month 

keep name month year 

gener n_rel_spgame = 0 
gener n_rel_game = 0 

local m = 3
while `m'<=4 {
	
	merge 1:1 name month year using "$P_Data_Processed/related_apps2014_0`m'_26.dta"
	drop if _merge==2 
	drop _merge 
	
	rename name name_orig 
	local i = 1
	while `i'<=4 {
		
		rename rel`i'_name name 
		merge m:1 name using "$P_Data_Processed/name_game_05_2014.dta"
		drop if _merge==2 
		drop _merge 
		rename game game`i'
		
		replace n_rel_spgame = n_rel_spgame + 1 if game`i'==1  & month==`m'
		replace n_rel_game = n_rel_game + 1 if game`i'!=. & month==`m'
		
		drop name 
		drop game`i'
		
		local i = `i'+1
	}
	
	rename name_orig name 
	
	local m = `m'+1
}

gener rel_spgame_share = n_rel_spgame/ n_rel_game


gener new_cat = "Sports Games" if rel_spgame_share>=0.5 & rel_spgame_share!=.
replace new_cat = "Sports" if new_cat==""
keep name month year new_cat 
gener game_cat = 0
replace game_cat = 1 if new_cat=="Sports Games"
gegen game_cat_max = max(game_cat), by(name)
replace new_cat = "Sports Games" if game_cat_max==1 
replace new_cat = "Sports" if game_cat_max==0
keep name month year new_cat 

save "$P_Data_Processed/sports_sports_games_2014_03_04.dta", replace 

clear 

use "$P_Data_Processed/monthly_app_data.dta"

fsort name year month
by name month year: drop if _n>1

merge 1:1 name month year using  "$P_Data_Processed/sports_sports_games_2014_03_04.dta"
drop if _merge==2

replace category = "Sports Games" if new_cat=="Sports Games" & year==2014 & (month==3 | month==4) & _merge==3
replace game =  1 if new_cat=="Sports Games" & year==2014 & (month==3 | month==4) & _merge==3

replace category = "Sports" if new_cat=="Sports" & year==2014 & (month==3 | month==4) & _merge==3
replace game =  0 if new_cat=="Sports" & year==2014 & (month==3 | month==4) & _merge==3
drop _merge 

drop new_cat 

gegen max_game = max(game), by(name)
replace game = max_game 
drop max_game 
save "$P_Data_Processed/monthly_app_data.dta", replace 

** generating names.dta - names and name ids - keeping only name_id in main file 

preserve 

	keep name 
	by name, sort: keep if _n==1
	gegen name_id = group(name)
	save "$P_Data_Processed/names.dta", replace 

restore 

merge m:1 name using "$P_Data_Processed/names.dta"
keep if _merge==3
drop _merge
drop name 

save "$P_Data_Processed/monthly_app_data.dta", replace 

preserve 

keep name game 
by name, sort: keep if _n==1
save "$P_Data_Processed/name_game.dta", replace 

restore 


** generating paid_nongames.dta - file that has names of all non-games + year + month + whether or not they are paid

preserve 

	keep name_id month year paid 
	save "$P_Data_Processed/name_paid.dta", replace 

restore 


** generating google.dta - identifying all google owned non-games
clear
use "$P_Data_Processed/monthly_app_data.dta"
keep name_id game
by name_id, sort: keep if _n==1
merge 1:1 name_id using  "$P_Data_Processed/names.dta"
keep if _merge==3
drop _merge
gener google = (strpos(name, "com.google.android")>0)
keep google name_id game 
save "$P_Data_Processed/google.dta", replace 


** generating dev_id.dta - developer name and developer id - keeping only developer id in main file
clear
use "$P_Data_Processed/monthly_app_data.dta"
keep developer 
by developer, sort: keep if _n==1
gegen dev_id = group(developer)
save "$P_Data_Processed/dev_id.dta", replace 

clear
use "$P_Data_Processed/monthly_app_data.dta"
merge m:1 developer using "$P_Data_Processed/dev_id.dta"
keep if _merge==3
drop _merge
drop developer 
save "$P_Data_Processed/monthly_app_data.dta", replace 

* generating date variable 

gener date = ym(year,month)
save "$P_Data_Processed/monthly_app_data.dta", replace 

