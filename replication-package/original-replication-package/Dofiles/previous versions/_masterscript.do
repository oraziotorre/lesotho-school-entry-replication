**************************************************************************************
**************************************************************************************
* This do-file contains replication coding for the following article:
* Age at School Entry and Human Capital Development: Evidence from Lesotho
* Authors: De Neve, Moshoeshoe, Bor (2025)
* Stata version 17.0 was used for all analyses.
* Description: Master do-file
**************************************************************************************
**************************************************************************************

**************************************************************************************
* SET UP
**************************************************************************************

    *Version control
	version 17.0
	
	*Clear
	clear all
	set more off
	set maxvar 32767, permanently // to accomodate SE version
	cap log close _all

	*Find the right (Dropbox/Documents) folder depending on operating system (and/or user)
	if		c(os) == "Windows"	cap global project_folder "C:/Users/`c(username)'/Dropbox/AEJ" // for Windows
	else if c(os) == "MacOSX"	cap global project_folder "/Users/`c(username)'/Dropbox/AEJ" // for macbook and Linux OS
			
	cd "$project_folder"
	
	*Define directories
	global raw_data 			"$project_folder/raw_data"
	global mics2018_data		"$project_folder/raw_data/mics"
	global sacmeq_data			"$project_folder/raw_data/sacmeq"
	global dhs_data				"$project_folder/raw_data/dhs"
	global lesotho_census		"$project_folder/raw_data/ipums/lesotho"
	global southafrica_census	"$project_folder/raw_data/ipums/south_africa"
	global dofiles				"$project_folder/Dofiles"
	global output				"$project_folder/Output"
	global tables				"$project_folder/Output/Tables"
	global figures				"$project_folder/Output/Figures"
	global log_file				"$project_folder/Logfiles"
	
	*Open log
	local date: display %-td_YYNNDD date(c(current_date), "DMY")
	local date_yymmdd = subinstr("`date'", " ", "", .)
	global logfile "$log_file/`date_yymmdd'_masterscript.log" //path and name of the log file
	log using "${logfile}", replace


**************************************************************************************
* PART I: DATA
**************************************************************************************
	
qui do "$dofiles/AEJ_Datasets_6 Feb 2025.do"

**************************************************************************************
* PART II: FIGURES
**************************************************************************************

qui do "$dofiles/AEJ_Figures_6 Feb 2025.do"

**************************************************************************************
* PART III: TABLES
**************************************************************************************

qui do "$dofiles/AEJ_Tables_6 Feb 2025.do"