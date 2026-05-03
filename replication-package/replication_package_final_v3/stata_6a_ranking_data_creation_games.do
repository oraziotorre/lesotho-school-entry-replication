clear
set more off
cd "$P_Ranking_Data_Games"

cap erase "$P_Data_Processed/android_toprankings_games_weekly.dta"

local files : dir . files "toprankings*.csv"

foreach file of local files {

	local i =  4
	* v1 rank in category/type
	* v2 category 
	* v3 date 
	* v4 paid 
	* v5 free

	* v6-v8 are NOT relevant for purpose of predicting downloads 
	* v6 grossing
	* v7 new paid
	* v8 new free

	while `i'<=5 {
		clear
		insheet using "`file'"

		keep v1 v2 v3 v`i'

		rename v`i' app_name
		rename v1 rank
		rename v2 category

		drop if category=="overall"

		gener date = date(v3,"YMD")
		drop v3

		gener rank_category=""

		drop if app_name==""
		drop if app_name=="0'"

		if `i' == 4 {
		replace rank_category = "free"
		}
		if `i' ==5 { 
		replace rank_category= "paid"
		}

		cap append using "$P_Data_Processed/android_toprankings_games_weekly.dta"
		save "$P_Data_Processed/android_toprankings_games_weekly.dta", replace 

		local i = `i'+1
	}

}

clear 
use "$P_Data_Processed/android_toprankings_games_weekly.dta"


rename app_name name
replace name = subinstr(name, "/apps/google-play/app/","",.)
replace name = subinstr(name, "apps/google-play/app/","",.)
replace name = subinstr(name, "/details","",.)
replace name = subinstr(name, "/","",.)


merge m:1 name using "/Users/danielershov/Google Drive/New Estimates/names.dta"
keep if _merge==3
drop _merge

drop name

by name date, sort: keep if _n==1

drop rank_category 
drop category 

save "$P_Data_Processed/android_toprankings_games_weekly.dta", replace


