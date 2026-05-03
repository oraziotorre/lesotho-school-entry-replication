*** NON GAME WEEKLY DATA 

clear

set more off 

cap erase "$P_Data_Processed/weekly_nongames_data.dta"

cd "$P_Weekly_Data_NonGames"

local files : dir . files "*.csv"

foreach f of local files {
	clear

	local d = subinstr("`f'",".csv","",.)
	local d = subinstr("`d'","weeklydata_nongames_","",.)

	insheet using "`f'"


	rename v1 name
	rename v2 category


	replace v3 = subinstr(v3, ",","",.)
	split v3, p("-")
	drop v3
	destring v31, replace force
	destring v32, replace force
	rename v31 min_download 
	rename v32 max_download
	replace min_download = 0 if missing(min_download)
	replace max_download = 0 if missing(max_download)

	gener d = "`d'"
	gener date = date(d, "YMD")
	format date %td
	drop d

	merge m:1 name using "$P_Data_Processed/names.dta"
	keep if _merge==3
	drop _merge
	drop name
	
	merge 1:1 name using "$P_Data_Processed/name_game.dta"
	drop if _merge==2 
	drop if game==1 & (category=="Sports Games" | category=="Sports")
	drop game 

	compress 

	capture append using "$P_Data_Processed/weekly_nongames_data.dta"

	save "$P_Data_Processed/weekly_nongames_data.dta", replace

}


*** GAME WEEKLY DATA 

clear

set more off 

cap erase "$P_Data_Processed/weekly_games_data.dta"

cd "$P_Weekly_Data_Games"

local files : dir . files "*.csv"

foreach f of local files {
	clear

	local d = subinstr("`f'",".csv","",.)
	local d = subinstr("`d'","weeklydata_games_","",.)

	insheet using "`f'"


	rename v1 name
	rename v2 category


	replace v3 = subinstr(v3, ",","",.)
	split v3, p("-")
	drop v3
	destring v31, replace force
	destring v32, replace force
	rename v31 min_download 
	rename v32 max_download
	replace min_download = 0 if missing(min_download)
	replace max_download = 0 if missing(max_download)

	gener d = "`d'"
	gener date = date(d, "YMD")
	format date %td
	drop d

	merge m:1 name using "$P_Data_Processed/names.dta"
	keep if _merge==3
	drop _merge
	drop name
	
	merge 1:1 name using "$P_Data_Processed/name_game.dta"
	drop if _merge==2 
	drop if game==0 & (category=="Sports Games" | category=="Sports")
	drop game 
	
	compress 

	capture append using "$P_Data_Processed/weekly_games_data.dta"

	save "$P_Data_Processed/weekly_games_data.dta", replace

}

