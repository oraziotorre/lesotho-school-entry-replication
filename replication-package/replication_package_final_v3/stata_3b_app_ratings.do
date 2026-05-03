clear
set more off

cap erase "$P_Data_Processed/app_ratings.dta"

cd "$P_Monthly_Data"

local files : dir . files "apprating*.csv"

foreach file of local files {

clear
insheet using "`file'"

rename v1 name
rename v2 ratings

by name, sort: keep if _n==1

merge m:1 name using "$P_Data_Processed/names.dta"
keep if _merge==3
drop _merge
drop name



replace ratings = subinstr(ratings, "{","",.)
replace ratings = subinstr(ratings, "}","",.)
split ratings, p(",")
drop ratings
	
rename ratings1 r1
rename ratings2 r3
rename ratings3 r2
rename ratings4 r5
rename ratings5 r4
		
local r = 1
while `r'<=5 {
	replace r`r' = subinstr(r`r', "u","",.)
	replace r`r' = subinstr(r`r', "'","",.)
	replace r`r' = subinstr(r`r',"`r':","",.)
	destring r`r', replace force
	replace r`r' = 0 if missing(r`r')
	local r = `r'+1
}

gener n_ratings = r1 + r2 + r3 + r4 + r5 
gener share_1star = r1/n_ratings
gener share_5star = r5/n_ratings
gener avg_rating = (1*r1+2*r2+3*r3+4*r4+5*r5)/n_ratings 
replace avg_rating = 0 if missing(avg_rating)

local year = substr("`file'", 10,4)
local month = substr("`file'",15,2)
display `year'
display `month'
gener year = `year'
gener month = `month'
gener date = ym(year,month)
drop year month

drop r1 r2 r3 r4 r5 

capture append using "$P_Data_Processed/app_ratings.dta"
save "$P_Data_Processed/app_ratings.dta", replace

}
