
clear
set more off 

local m = 4
local year = 2014

cd "$P_Main"

while `m'>=3 {
	
	clear
	insheet using "$P_Monthly_Data/related_apps`year'_0`m'_26.csv"
	
	rename v1 name 
	
	local j = 6 
	while `j'<=18 {
		capture drop v`j'
		local j = `j'+1
	}
	
	local j=2
	while `j'<=5 {
		
		local i = `j'-1
		rename v`j' rel`i'_name
		local j = `j'+1
		
	}
	
	gener month = `m'
	gener year = 2014 
	save "$P_Data_Processed/related_apps`year'_0`m'_26.dta", replace
	local m = `m'-1
}	
