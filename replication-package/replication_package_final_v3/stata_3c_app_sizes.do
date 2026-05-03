clear
set more off

cap erase "$P_Data_Processed/app_sizes.dta"

cd "$P_Monthly_Data"

local files : dir . files "appsize*.csv"

foreach file of local files {

clear
insheet using "`file'"

rename v1 name
rename v2 size_raw

by name, sort: keep if _n==1

merge m:1 name using "$P_Data_Processed/names.dta"
keep if _merge==3
drop _merge
drop name


replace size_raw = subinstr(size_raw,",","",.)
gener size_type = substr(size_raw,-1,1)
gener size = substr(size_raw, 1,length(size_raw)-1)
destring size, replace force
replace size = size/1000 if size_type=="k"
replace size = size*1000 if size_type=="G"
drop size_raw size_type 
drop if size ==.

local year = substr("`file'", 9,4)
local month = substr("`file'",14,2)
gener year = `year'
gener month = `month'
gener date = ym(year,month)
drop year month

capture append using "$P_Data_Processed/app_sizes.dta"
save "$P_Data_Processed/app_sizes.dta", replace

}
