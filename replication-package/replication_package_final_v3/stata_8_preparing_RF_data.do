clear
set more off

**************************************************************************
**************************************************************************
**************************************************************************
**************************************************************************


clear
use "$P_Data_Processed/monthly_app_data.dta"
** will do this separately for games and non-games
** start with games 
keep if game==1 
** new definition of categories based on last period in the sample 
fsort name date
by name date: keep if _n==1
by name: gener cat_id_fin = category[_N]

gegen last_date = max(date), by(name_id)
merge m:1 name using "$P_Data_Processed/pre_exit_ML_categories.dta"
drop if _merge==2
replace cat_id_fin = cat_id_string if last_date<650
drop cat_id_string 
* dropping rest of apps with unassigned categories 
drop if cat_id_fin=="" & _merge==1
drop _merge

* generating new numeric values for categories 
egen cat_id = group(cat_id_fin), label 
drop cat_id_fin 

fsort name date
by name: gener download_ratings = n_ratings - n_ratings[_n-1] if _n>1
replace download_ratings = 0 if download_ratings<0


merge m:1 name_id using "$P_Data_Processed/google.dta"
drop if google==1
drop _merge
drop google


capture drop size
merge 1:1 name date using "$P_Data_Processed/app_sizes.dta"
keep if _merge==3
drop _merge


merge 1:1 name date using "$P_Data_Processed/app_ratings.dta"
keep if _merge==3
drop _merge
*drop if paid==1

gegen first_date = min(date), by(name_id)
gener new_app = (date==first_date)

gener new_size = new_app*size
gener new_price = new_app* price

gener l_size = ln(size)

*** at game/nongame level ***
fsort game date cat_id name_id

gener app_exists =1 
gener new_paid_app = paid*new_app

gegen n_apps = total(app_exists), by(game date)
gegen n_new_apps = total(new_app), by(game date)
gegen n_new_paid_apps = total(new_paid_app), by(game date)

gegen temp_mean_price = mean(price) if paid==1, by(game date)
gegen mean_price = max(temp_mean_price), by(game date)
drop temp_mean_price 

gegen temp_mean_price = mean(price) if paid==1 & new_app==1, by(game date)
gegen new_mean_price = max(temp_mean_price), by(game date)
drop temp_mean_price 

*** at category level ***
fsort cat_id date name_id

gegen cat_n_apps = total(app_exists), by(cat_id date) 
gegen cat_n_new_apps = total(new_app), by(cat_id date)
gegen cat_n_new_paid_apps = total(new_paid_app), by(cat_id date)

gegen temp_mean_price = mean(price) if paid==1, by(cat_id date)
gegen cat_mean_price = max(temp_mean_price), by(cat_id date)
drop temp_mean_price 

gegen temp_mean_price = mean(price) if paid==1 & new_app==1, by(cat_id date)
gegen new_cat_mean_price = max(temp_mean_price), by(cat_id date)
drop temp_mean_price 


***** MERGE IN PREDICTED downs DATA ******

merge 1:1 name date using "$P_Data_Processed/monthly_downloads_games.dta"
keep if _merge==3
drop _merge

gener p5 = (n_ratings>=5)

* at game/nongame level
fsort game date cat_id name_id
gegen tot_downs = total(monthly_pred_downloads), by(game date)

gegen tot_download_ratings = total(download_ratings), by(game date)

gegen temp_tot_downs_new = total(monthly_pred_downloads) if new_app==1, by(game date)
gegen tot_downs_new = max(temp_tot_downs_new), by(game date) 
drop temp_tot_downs_new

gegen temp_tot_downs_new = total(download_ratings) if new_app==1, by(game date)
gegen tot_download_ratings_new = max(temp_tot_downs_new), by(game date) 
drop temp_tot_downs_new

gegen temp_tot_downs_new_p5 = total(monthly_pred_downloads) if new_app==1 & n_ratings>=5, by(game date)
gegen tot_downs_new_p5 = max(temp_tot_downs_new_p5) , by(game date)
drop temp_tot_downs_new_p5


* at category level
fsort cat_id date name_id 

gegen tot_downs_cat = total(monthly_pred_downloads), by(cat_id date)

gegen tot_download_ratings_cat = total(download_ratings), by(cat_id date)

gegen temp_tot_downs_cat_new = total(monthly_pred_downloads) if new_app==1, by(cat_id date)
gegen tot_downs_cat_new = max(temp_tot_downs_cat_new) , by(cat_id date)
drop temp_tot_downs_cat_new

gegen temp_tot_downs_cat_new = total(download_ratings) if new_app==1, by(cat_id date)
gegen tot_download_ratings_cat_new = max(temp_tot_downs_cat_new) , by(cat_id date)
drop temp_tot_downs_cat_new

gegen temp_tot_downs_cat_new_p5 = total(monthly_pred_downloads) if new_app==1 & n_ratings>=5, by(cat_id date)
gegen tot_downs_cat_new_p5 = max(temp_tot_downs_cat_new_p5) , by(cat_id date)
drop temp_tot_downs_cat_new_p5


capture drop use_cat
by cat_id date: gener use_cat = 1 if _n==1

**************************************************************************
by cat_id date: keep if _n==1
 
by game date, sort: gener use_game=1 if _n==1


drop download_ratings size share_1star share_5star first_date new_app new_size new_price l_size app_exists

drop last_date monthly_pred_downloads 

drop price update_date paid min_download max_download avg_rating n_ratings name_id dev_id

drop new_paid_app

decode cat_id, gen(cat_id_string)
drop cat_id 

save "$P_Data_Processed/RF_data.dta", replace

**************************************************************************
**************************************************************************
**************************************************************************
**************************************************************************

* DO SAME THING FOR NON-GAMES 
**************************************************************************
**************************************************************************
**************************************************************************
************************************************************************** 

clear
use "$P_Data_Processed/monthly_app_data.dta"
** will do this separately for games and non-games
** start with games 
keep if game==0
** new definition of categories based on last period in the sample 
fsort name date
by name date: keep if _n==1
by name: gener cat_id_fin = category[_N]

gegen last_date = max(date), by(name_id)
merge m:1 name using "$P_Data_Processed/pre_exit_ML_categories.dta"
drop if _merge==2
replace cat_id_fin = cat_id_string if last_date<650
drop cat_id_string 
* dropping rest of apps with unassigned categories 
drop if cat_id_fin=="" & _merge==1
drop _merge

* generating new numeric values for categories 
egen cat_id = group(cat_id_fin), label 
drop cat_id_fin 

fsort name date
by name: gener download_ratings = n_ratings - n_ratings[_n-1] if _n>1
replace download_ratings = 0 if download_ratings<0


merge m:1 name_id using "$P_Data_Processed/google.dta"
drop if google==1
drop _merge
drop google


capture drop size
merge 1:1 name date using "$P_Data_Processed/app_sizes.dta"
keep if _merge==3
drop _merge


merge 1:1 name date using "$P_Data_Processed/app_ratings.dta"
keep if _merge==3
drop _merge
*drop if paid==1

gegen first_date = min(date), by(name_id)
gener new_app = (date==first_date)

gener new_size = new_app*size
gener new_price = new_app* price

gener l_size = ln(size)

*** at game/nongame level ***
fsort game date cat_id name_id

gener app_exists =1 
gener new_paid_app = paid*new_app

gegen n_apps = total(app_exists), by(game date)
gegen n_new_apps = total(new_app), by(game date)
gegen n_new_paid_apps = total(new_paid_app), by(game date)

gegen temp_mean_price = mean(price) if paid==1, by(game date)
gegen mean_price = max(temp_mean_price), by(game date)
drop temp_mean_price 

gegen temp_mean_price = mean(price) if paid==1 & new_app==1, by(game date)
gegen new_mean_price = max(temp_mean_price), by(game date)
drop temp_mean_price 

*** at category level ***
fsort cat_id date name_id

gegen cat_n_apps = total(app_exists), by(cat_id date) 
gegen cat_n_new_apps = total(new_app), by(cat_id date)
gegen cat_n_new_paid_apps = total(new_paid_app), by(cat_id date)

gegen temp_mean_price = mean(price) if paid==1, by(cat_id date)
gegen cat_mean_price = max(temp_mean_price), by(cat_id date)
drop temp_mean_price 

gegen temp_mean_price = mean(price) if paid==1 & new_app==1, by(cat_id date)
gegen new_cat_mean_price = max(temp_mean_price), by(cat_id date)
drop temp_mean_price 


***** MERGE IN PREDICTED downs DATA ******

merge 1:1 name date using "$P_Data_Processed/monthly_downloads_nongames.dta"
keep if _merge==3
drop _merge

gener p5 = (n_ratings>=5)

* at game/nongame level
fsort game date cat_id name_id
gegen tot_downs = total(monthly_pred_downloads), by(game date)

gegen tot_download_ratings = total(download_ratings), by(game date)

gegen temp_tot_downs_new = total(monthly_pred_downloads) if new_app==1, by(game date)
gegen tot_downs_new = max(temp_tot_downs_new), by(game date) 
drop temp_tot_downs_new

gegen temp_tot_downs_new = total(download_ratings) if new_app==1, by(game date)
gegen tot_download_ratings_new = max(temp_tot_downs_new), by(game date) 
drop temp_tot_downs_new

gegen temp_tot_downs_new_p5 = total(monthly_pred_downloads) if new_app==1 & n_ratings>=5, by(game date)
gegen tot_downs_new_p5 = max(temp_tot_downs_new_p5) , by(game date)
drop temp_tot_downs_new_p5


* at category level
fsort cat_id date name_id 

gegen tot_downs_cat = total(monthly_pred_downloads), by(cat_id date)

gegen tot_download_ratings_cat = total(download_ratings), by(cat_id date)

gegen temp_tot_downs_cat_new = total(monthly_pred_downloads) if new_app==1, by(cat_id date)
gegen tot_downs_cat_new = max(temp_tot_downs_cat_new) , by(cat_id date)
drop temp_tot_downs_cat_new

gegen temp_tot_downs_cat_new = total(download_ratings) if new_app==1, by(cat_id date)
gegen tot_download_ratings_cat_new = max(temp_tot_downs_cat_new) , by(cat_id date)
drop temp_tot_downs_cat_new

gegen temp_tot_downs_cat_new_p5 = total(monthly_pred_downloads) if new_app==1 & n_ratings>=5, by(cat_id date)
gegen tot_downs_cat_new_p5 = max(temp_tot_downs_cat_new_p5) , by(cat_id date)
drop temp_tot_downs_cat_new_p5


capture drop use_cat
by cat_id date: gener use_cat = 1 if _n==1

**************************************************************************
by cat_id date: keep if _n==1
 
by game date, sort: gener use_game=1 if _n==1


drop download_ratings size share_1star share_5star first_date new_app new_size new_price l_size app_exists

drop last_date monthly_pred_downloads 

drop price update_date paid min_download max_download avg_rating n_ratings name_id dev_id

drop new_paid_app

decode cat_id, gen(cat_id_string)
drop cat_id 

append using "$P_Data_Processed/RF_data.dta"
save "$P_Data_Processed/RF_data.dta", replace

**************************************************************************
**************************************************************************
**************************************************************************
************************************************************************** 
egen cat_id = group(cat_id_string), label 
***** Generating Treatment Dummies / Date and Game Category Fixed Effects *****
set more off
drop if date==624

tab cat_id if game==1, gen(catdum)

tab date, gen(datedum)

gener treat_period = (date>=650)

gener treat_group = (game==1)
gener treat_dum = treat_period*treat_group


local i = 1 
while `i'<=18 { 

replace catdum`i' = 0 if missing(catdum`i')

gener treat_catdum`i' = treat_period * catdum`i'
local i = `i'+1
}

set more off
local i = 9 
while `i'>-24 {

	if `i'<0 {
		local absi = -`i'
		gener treat_time_m`absi'=0
		replace treat_time_m`absi'= 1 if date==650+`i' & treat_group==1	
		label var treat_time_m`absi' "(Split Cat.==1)*(Date == Split Date - `absi')"
	}
	if `i'>=0 {
		gener treat_time_p`i' = 0 
		replace treat_time_p`i' = 1 if date==650+`i' & treat_group==1
		if `i'==0 {
			label var  treat_time_p0 "(Split Cat.==1)*(Date ==Split Date)"
		}
		else {
			label var treat_time_p`i' "(Split Cat.==1)*(Date == Split Date + `i')"
		}

	}
	local i = `i'-1
} 



by cat_id, sort: egen mean_n_apps = mean(cat_n_apps) if year==2012


sort cat_id mean_n_apps

by cat_id: replace mean_n_apps = mean_n_apps[1]
gener l_mean_n_apps = log(mean_n_apps)


by cat_id, sort: egen mean_n_apps_2013 = mean(cat_n_apps) if year==2013 & month<12


sort cat_id mean_n_apps_2013

by cat_id: replace mean_n_apps_2013 = mean_n_apps_2013[1]
gener l_mean_n_apps_2013 = log(mean_n_apps_2013)


gener l_n_new_apps = log(n_new_apps)

gener l_cat_n_new_apps = log(cat_n_new_apps)



save "$P_Data_Processed/RF_data.dta", replace






