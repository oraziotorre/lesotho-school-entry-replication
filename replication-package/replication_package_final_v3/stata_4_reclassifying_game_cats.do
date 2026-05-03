set more off
cd "$P_Monthly_Data" 
clear


cap erase "$P_Data_Processed/pre_exit_ML_categories.dta"

local y = 2014 
local m = 2

while `y'>2011 {
	while `m'>0 {
		clear 
		if `m'>9 {
			insheet using "$P_Monthly_Data/categories_`y'_`m'_26.csv"
		}
		if `m'<10 {
			insheet using "$P_Monthly_Data/categories_`y'_0`m'_26.csv"
		}	
		
		rename v1 name
		rename v2 old_cat
		rename v3 new_cat
		by name, sort: keep if _n==1
		
		gener year = `y'
		gener month = `m'
		capture append "$P_Data_Processed/pre_exit_ML_categories.dta"
		
		save "$P_Data_Processed/pre_exit_ML_categories.dta", replace 

		local m = `m'-1
	}
	local y = `y'-1
	local m = 12
}


sort name year month
by name: keep if _n==_N
rename new_cat cat_id_string

keep name cat_id_string

merge m:1 name using "$P_Data_Processed/names.dta"
keep if _merge==3
drop _merge
drop name

save "$P_Data_Processed/pre_exit_ML_categories.dta", replace 

