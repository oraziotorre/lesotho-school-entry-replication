clear
set more off

cap erase "$P_Data_Processed/n_screenshots_videos.dta"

cd "$P_Monthly_Data"

local files : dir . files "screenshot*.csv"

foreach file of local files {

clear
insheet using "`file'"

rename v1 name
rename v2 n_videos
rename v3 n_screenshots

by name, sort: keep if _n==1

merge m:1 name using "$P_Data_Processed/names.dta"
keep if _merge==3
drop _merge
drop name

capture destring n_videos, replace force
capture destring n_screenshots, replace force

local year = substr("`file'", 12,4)
local month = substr("`file'",17,2)
display `year'
display `month'
gener year = `year'
gener month = `month'
gener date = ym(year,month)
drop year month

capture append using "$P_Data_Processed/n_screenshots_videos.dta"

save "$P_Data_Processed/n_screenshots_videos.dta", replace

}
