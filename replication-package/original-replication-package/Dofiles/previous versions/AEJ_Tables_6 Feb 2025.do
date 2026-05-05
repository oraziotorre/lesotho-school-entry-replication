**************************************************************************************
**************************************************************************************
* This do-file contains replication coding for the following article:
* Age at School Entry and Human Capital Development: Evidence from Lesotho
* Authors: De Neve, Moshoeshoe, Bor (2025)
* Stata version 17.0 was used for all analyses.
* Description: Analysis/Tables 
**************************************************************************************
**************************************************************************************

**************************************************************************************
* SET UP
**************************************************************************************

	*Version control
	version 17.0
	
	*clear
	clear all
	set more off
	cap log close _all

	*Find the right (Dropbox/Documents) folder depending on operating system (and/or user)
	if		c(os) == "Windows"	cap global project_folder "C:/Users/`c(username)'/Dropbox/AEJ" // for Windows
	else if c(os) == "MacOSX"	cap global project_folder "/Users/`c(username)'/Dropbox/AEJ" // for macbook and Linux OS
			
	cd "$project_folder"
	
	*Define directories: 
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
	global logfile "$log_file/`date_yymmdd'_AEJ_tables.log" // path and name of the log file
	log using "${logfile}", replace
	
	*Required user-written commands	
	*ssc install rdrobust, replace // for rdplot, rddensity, etc
	*ssc install outreg2, replace
	*ssc install outreg, replace
	
**************************************************************************************
**************************************************************************************
* PART III. TABLES
**************************************************************************************
**************************************************************************************

/*
(1) Balance and placebo tests
(2) Total years of schooling completed among adults
(3) Heterogeneity in schooling among kids by household livestock ownership
(4) Total years of schooling completed adding household fixed effects
(5) Skills among adults
(6) Economic outcomes 
(7) Family formation outcomes
(8) HIV results
(9) Intergenerational impacts
(10) Time in nursery
(11) Opportunity costs
(12) Migration
(13) Decomposition exercice
*/

**************************************************************************************
* (1) BALANCE AND PLACEBO TESTS
**************************************************************************************

**# Bookmark

* Child-level

use "$dhs_data/dhskids.dta", clear // all kids who are alive and eligible
drop if bord1 == . | birthweight == . | stunt == . | anemia == . | cough == .
replace birthweight = birthweight/1000

outreg, clear(dv)
reg bord1 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
est sto m1
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Birth order `r'") nostars noautosumm se
reg birthweight birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
est sto m2
margins if birthmo <=6, at(birthmo_cent == 0) post 
outreg, merge(dv) ctitle("","Birthweight `r'") nostars noautosumm se
reg stunt birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
est sto m3
margins if birthmo <=6, at(birthmo_cent == 0) post 
outreg, merge(dv) ctitle("","Stunting `r'") nostars noautosumm se
reg under birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
est sto m4
margins if birthmo <=6, at(birthmo_cent == 0) post 
outreg, merge(dv) ctitle("","Underweight `r'") nostars noautosumm se
reg anemia birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
est sto m5
margins if birthmo <=6, at(birthmo_cent == 0) post 
outreg, merge(dv) ctitle("","Anemia `r'") nostars noautosumm se
reg cough birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
est sto m6
margins if birthmo <=6, at(birthmo_cent == 0) post 
outreg, merge(dv) ctitle("","Cough `r'") nostars noautosumm se
outreg2 [m1 m2 m3 m4 m5 m6] using "$output/tables/balance_test_results_child.doc", se keep (birthmo_jul) dec(3) replace title (Balance in background characteristics among children) nocons nonotes 
outreg using "$output/tables/balance_test_results_child.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Household- or adult-level

use "$dhs_data/dhskids.dta", clear // all kids who are alive and eligible
outreg, clear(dv)
drop if momprim == .
reg momprim birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/balance_test_results_household.doc", se keep (birthmo_jul) dec(3) replace title (Balance in background characteristics among households and adults) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Mom educ `r'") nostars noautosumm se
reg wi birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/balance_test_results_household.doc", se keep (birthmo_jul) dec(3) append nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Wealth `r'") nostars noautosumm se

use "$dhs_data/dhspooledPR.dta", clear // HH member file
keep if age >= 18 & age <= 59
replace height = height/100 // height not available for men in 2004 survey
reg height birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/balance_test_results_household.doc", se keep (birthmo_jul) dec(3) append nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Height `r'") nostars noautosumm se

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 18 & age <= 59
reg maseru birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/balance_test_results_household.doc", se keep (birthmo_jul) dec(3) append nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Maseru-born `r'") nostars noautosumm se
outreg using "$output/tables/balance_test_results_household.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* (2) TOTAL YEARS OF SCHOOLING COMPLETED AMONG ADULTS
**************************************************************************************

**# Bookmark

* Total years of schooling completed

use "$mics2018_data/mics6hl.dta", clear // MICS
outreg, clear(dv)
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent if age >= 18 & age <= 35, r
est sto m1
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 1") nostars noautosumm se
reg eduyrs birthmo_jul c.birthmo_cent c.birthmo_cent2 i.birthmo_jul#c.birthmo_cent i.birthmo_jul#c.birthmo_cent2 if age >= 18 & age <= 35, r
est sto m2
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 2") nostars noautosumm se
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex if age >= 18 & age <= 35, r
est sto m3
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 3") nostars noautosumm se
outreg2 [m1 m2 m3] using "$output/tables/total_schooling.doc", se keep (birthmo_jul) dec(3) replace title (Total years of schooling completed) ctitle (MICS, Schooling) nocons nonotes

use "$dhs_data/dhspooled.dta", clear // DHS
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year if age >= 18 & age <= 49, r
outreg2 using "$output/tables/total_schooling.doc", se keep (birthmo_jul) dec(3) append ctitle (DHS, Schooling) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 4") nostars noautosumm se

use "$lesotho_census/census2006.dta", clear // Census excluding June
keep if age >= 18 & age <= 49
drop if birthmo==6
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r
outreg2 using "$output/tables/total_schooling.doc", se keep (birthmo_jul) dec(3) append ctitle (Census, Schooling) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 5") nostars noautosumm se
outreg using "$output/tables/total_schooling.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

use "$mics2018_data/mics6hl.dta", clear // sample and clustering effects
outreg, clear(dv)
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex if (age >= 18 & age <= 35) & (birthmo >= 2 & birthmo <= 11), r
est sto m1
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 1") nostars noautosumm se
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex if (age >= 18 & age <= 35) & (birthmo != 6 & birthmo != 7), r
est sto m2
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 2") nostars noautosumm se
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex if age >= 18 & age <= 35, cluster(stratum)
est sto m3
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 3") nostars noautosumm se
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex if age >= 18 & age <= 35, cluster(HH1)
est sto m4
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 4") nostars noautosumm se
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex if age >= 18 & age <= 35, cluster(birthmo_cent)
est sto m5
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 5") nostars noautosumm se
outreg2 [m1 m2 m3 m4 m5] using "$output/tables/total_schooling_clustering.doc", se keep (birthmo_jul) dec(3) replace title (Total years of schooling completed using alternative sample and clustering specifications) nocons nonotes
outreg using "$output/tables/total_schooling_clustering.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Total years of schooling completed by data source and gender

use "$dhs_data/dhspooled.dta", clear // DHS
outreg, clear(dv)
keep if age >= 18 & age <= 59
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1, r
outreg2 using "$output/tables/total_schooling_by_gender.doc", se keep (birthmo_jul) dec(3) replace title (Total years of schooling completed by data source and gender) ctitle (DHS, Female, Schooling) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 1") nostars noautosumm se
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0, r
outreg2 using "$output/tables/total_schooling_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle (DHS, Male, Schooling) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 2") nostars noautosumm se

use "$mics2018_data/mics6hl.dta", clear // MICS
keep if age >= 18 & age <= 59
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age if fem == 1, r
outreg2 using "$output/tables/total_schooling_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle (MICS, Female, Schooling) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 3") nostars noautosumm se 
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age if fem == 0, r
outreg2 using "$output/tables/total_schooling_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle (MICS, Male, Schooling) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 4") nostars noautosumm se
outreg using "$output/tables/total_schooling_by_gender.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Total years of schooling completed using smalller windows of birthmonths

use "$mics2018_data/mics6hl.dta", clear // MICS
outreg, clear(dv)
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.fem if (age >= 18), r
est sto m1
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 1") nostars noautosumm se
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.fem if (age >= 18) & (birthmo >= 2 & birthmo <= 11), r
est sto m2
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 2") nostars noautosumm se
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.fem if (age >= 18) & (birthmo >= 3 & birthmo <= 10), r
est sto m3
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 3") nostars noautosumm se
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.fem if (age >= 18) & (birthmo >= 4 & birthmo <= 9), r
est sto m4
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 4") nostars noautosumm se
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.fem if (age >= 18) & (birthmo >= 5 & birthmo <= 8), r
est sto m5
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 5") nostars noautosumm se
outreg2 [m1 m2 m3 m4 m5] using "$output/tables/total_schooling_smaller_MOB_windows_mics.doc", se keep (birthmo_jul) dec(3) replace title (Total years of schooling completed using smaller MOB windows - MICS) nocons nonotes
outreg using "$output/tables/total_schooling_smaller_MOB_windows_mics.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* (3) HETEROGENEITY IN EDUCATION AMONG KIDS BY HOUSEHOLD LIVESTOCK OWNERSHIP
**************************************************************************************

**# Bookmark

* Adding data on livestock ownership from household-level file

use "$mics2018_data/mics6hl.dta", clear // household members
merge m:m HH1 HH2 using "$mics2018_data/hh.dta" // household-level characteristics
keep if _merge==3
drop _merge
save "$mics2018_data/mics6hl_hh.dta", replace

* Kids ages 5-10 years at start of school year

use "$mics2018_data/mics6hl_hh.dta", clear
outreg, clear(dv)
keep if schage >=5 & schage <= 10

reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage i.fem if HC17 == 2, r // HH owns no animals
est sto m1
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 1") nostars noautosumm se
reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if HC17 == 2 & fem == 1, r 
est sto m2
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 2") nostars noautosumm se
reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if HC17 == 2 & fem == 0, r
est sto m3
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 3") nostars noautosumm se
reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage i.fem if HC17 == 1, r // HH owns animals
est sto m4
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 4") nostars noautosumm se
reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if HC17 == 1 & fem == 1, r
est sto m5
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 5") nostars noautosumm se
reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if HC17 == 1 & fem == 0, r
est sto m6
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 6") nostars noautosumm se

outreg2 [m1 m2 m3 m4 m5 m6] using "$output/tables/total_schooling_livestock_ages_5-10.doc", se keep (birthmo_jul) dec(3) replace title (Total years of schooling by HH ownership of livestock - ages 5-10) nocons nonotes
outreg using "$output/tables/total_schooling_livestock_ages_5-10.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Kids ages 11-18 years at start of school year

use "$mics2018_data/mics6hl_hh.dta", clear
outreg, clear(dv)
keep if schage >=11 & schage <= 18

reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage i.fem if HC17 == 2, r // HH owns no animals
est sto m1
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 1") nostars noautosumm se
reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if HC17 == 2 & fem == 1, r 
est sto m2
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 2") nostars noautosumm se
reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if HC17 == 2 & fem == 0, r
est sto m3
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 3") nostars noautosumm se
reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage i.fem if HC17 == 1, r // HH owns animals
est sto m4
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 4") nostars noautosumm se
reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if HC17 == 1 & fem == 1, r
est sto m5
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 5") nostars noautosumm se
reg educ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if HC17 == 1 & fem == 0, r
est sto m6
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 6") nostars noautosumm se

outreg2 [m1 m2 m3 m4 m5 m6] using "$output/tables/total_schooling_livestock_ages_11-18.doc", se keep (birthmo_jul) dec(3) replace title (Total years of schooling by HH ownership of livestock - ages 11-18) nocons nonotes
outreg using "$output/tables/total_schooling_livestock_ages_11-18.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* (4) TOTAL SCHOOLING COMPLETED ADDING HOUSEHOLD FIXED EFFECTS
**************************************************************************************

**# Bookmark

use "$mics2018_data/mics6hl.dta", clear // MICS
rename HH1 clusterID
keep if age >= 18 & age <= 35
egen householdID = group(clusterID HH2) 
bys householdID: gen is_singleton = (_N==1)
tab is_singleton
reg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.fem i.clusterID, r
est sto m1
xtset householdID
xtreg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.fem, fe r 
est sto m2
outreg2 [m1 m2] using "$output/tables/total_schooling_HH_fixed_effects.doc", se keep (birthmo_jul) dec(3) replace title (Total years of schooling adding household fixed effects) ctitle (MICS) nocons

use "$dhs_data/dhspooled.dta", clear // DHS individual recode files
drop if eduyrs==.
drop if birthmo==.
gen cluster = mv001 if fem==0
replace cluster = v001 if fem==1
gen household = mv002 if fem==0
replace household = v002 if fem==1
gen person = mv003 if fem==0
replace person = v003 if fem==1
gen code = mv000 if fem==0
replace code = v000 if fem==1
gen householdID = ((cluster*1000)+household)
duplicates report householdID year person
gen cluster_year = cluster + (year*100)
gen householdID_year = (householdID + (year*100))
duplicates report householdID_year person
bysort householdID_year person: gen dup = cond(_N==1,0,_n)
drop if dup > 1
drop dup
keep if age >= 18 & age <= 49
bys householdID_year: gen is_singleton = (_N==1)
tab is_singleton
gen mal = 1 if fem == 0
replace mal = 0 if fem == 1
xtset householdID_year
xtreg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.mal i.year if age >= 18 & age <= 49 & is_singleton == 0, fe r
est sto m3
outreg2 [m3] using "$output/tables/total_schooling_HH_fixed_effects.doc", se keep (birthmo_jul) dec(3) append ctitle (DHS) nocons

use "$lesotho_census/census2006.dta", clear // Census
keep if age >= 18 & age <= 59
drop if birthmo==6 // exclude June-born
duplicates report serial pernum
bys serial: gen is_singleton = (_N==1)
tab is_singleton
xtset serial
xtreg eduyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.sex, fe r
est sto m4
outreg2 [m4] using "$output/tables/total_schooling_HH_fixed_effects.doc", se keep (birthmo_jul) dec(3) append ctitle (Census) nocons

**************************************************************************************
* (5) SKILLS AMONG ADULTS
**************************************************************************************

**# Bookmark

use "$mics2018_data/mics2018_wm_mn.dta", clear // using MICS
outreg, clear(dv)
drop if lit == . | comp == . | file == . | ict == . | inter == .
keep  if age >= 18 & age <= 49
reg lit birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r
outreg2 using "$output/tables/skills_adults.doc", se keep (birthmo_jul) dec(3) replace title (Skills among adults) ctitle(MICS, Lit) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Lit") nostars noautosumm se
reg ict birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r
outreg2 using "$output/tables/skills_adults.doc", se keep (birthmo_jul) dec(3) append ctitle(MICS, ICT) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","ICT") nostars noautosumm se

use "$dhs_data/dhspooled.dta", clear // using DHS
keep  if age >= 18 & age <= 49
reg lit birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r
outreg2 using "$output/tables/skills_adults.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Lit) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Lit") nostars noautosumm se
reg read birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r
outreg2 using "$output/tables/skills_adults.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Reading) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Reading") nostars noautosumm se
 
use "$lesotho_census/census2006.dta", clear // using Census
drop if literacy == . | lit_ease == .
drop if birthmo==6 // exclude June-born
reg lit_ease birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex if age >= 18 & age <= 49, r
outreg2 using "$output/tables/skills_adults.doc", se keep (birthmo_jul) dec(3) append ctitle (Census, Lit) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Lit") nostars noautosumm se
outreg using "$output/tables/skills_adults.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* (6) ECONOMIC OUTCOMES
**************************************************************************************

**# Bookmark

* Employment 

use "$dhs_data/dhspooled.dta", clear // using DHS data
outreg, clear(dv)
drop if worked12 == . | highskill == . | agri == .
keep if age >= 18 & age <= 59
reg worked12 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/economic.doc", se keep (birthmo_jul) dec(3) replace title (Economic outcomes among adults) ctitle(DHS, Worked12) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Worked12") nostars noautosumm se
reg agri birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/economic.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Agri) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Agri") nostars noautosumm se
reg highskill birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/economic.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Skill) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Skill") nostars noautosumm se

use "$lesotho_census/census2006.dta", clear // using Census data
drop if employed == . | skill == . | agri == .
keep if age >= 18
drop if birthmo==6 // exclude June-born
reg employed birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r 
outreg2 using "$output/tables/economic.doc", se keep (birthmo_jul) dec(3) append ctitle(Census, Employed) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Employed") nostars noautosumm se
reg agri birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r 
outreg2 using "$output/tables/economic.doc", se keep (birthmo_jul) dec(3) append ctitle(Census, Agri) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Agri") nostars noautosumm se 
reg skill birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r 
outreg2 using "$output/tables/economic.doc", se keep (birthmo_jul) dec(3) append ctitle(Census, Skill) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Skill") nostars noautosumm se
outreg using "$output/tables/economic.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Household wealth

use "$dhs_data/dhspooledPR.dta", clear // DHS HH member file with data on assets
outreg, clear(dv)
keep if age >= 18
reg livestock birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/HH_wealth.doc", se keep (birthmo_jul) dec(3) replace title (Household wealth among adults) ctitle(DHS, Animals) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Animals") nostars noautosumm se 
reg land birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/HH_wealth.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Land) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Land") nostars noautosumm se
reg bank birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/HH_wealth.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Bank) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Bank") nostars noautosumm se

use "$dhs_data/dhspooled.dta", clear
keep if age >= 18 & age <= 59
reg wi birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/HH_wealth.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, WI) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","WI") nostars noautosumm se

use "$lesotho_census/census2006.dta", clear // Census
keep if age >= 18 & age <= 59
drop if birthmo==6 // exclude June-born
reg cellph birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r 
outreg2 using "$output/tables/HH_wealth.doc", se keep (birthmo_jul) dec(3) append ctitle(Census, Phone) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Phone") nostars noautosumm se
reg telev birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r 
outreg2 using "$output/tables/HH_wealth.doc", se keep (birthmo_jul) dec(3) append ctitle(Census, TV) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","TV") nostars noautosumm se
reg fridge birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r 
outreg2 using "$output/tables/HH_wealth.doc", se keep (birthmo_jul) dec(3) append ctitle(Census, Fridge) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Fridge") nostars noautosumm se
reg car birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r 
outreg2 using "$output/tables/HH_wealth.doc", se keep (birthmo_jul) dec(3) append ctitle(Census, Car) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Car") nostars noautosumm se
outreg using "$output/tables/HH_wealth.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Economic outcomes by gender

use "$dhs_data/dhspooled.dta", clear
outreg, clear(dv)
drop if worked12 == . | highskill == . | agri == . | wi == .
keep if age >= 18 & age <= 59
reg worked12 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1, r 
outreg2 using "$output/tables/economic_by_gender.doc", se keep (birthmo_jul) dec(3) replace title (Economic outcomes among adults by gender) ctitle(DHS, Female, Worked) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Worked") nostars noautosumm se
reg worked12 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0, r 
outreg2 using "$output/tables/economic_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Male, Worked) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Worked") nostars noautosumm se
reg agri birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1, r 
outreg2 using "$output/tables/economic_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Female, Agri) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Agri") nostars noautosumm se
reg agri birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0, r 
outreg2 using "$output/tables/economic_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Male, Agri) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Agri") nostars noautosumm se
reg highskill birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1, r 
outreg2 using "$output/tables/economic_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Female, Skill) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Skill") nostars noautosumm se
reg highskill birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0, r 
outreg2 using "$output/tables/economic_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Male, Skill) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Skill") nostars noautosumm se
reg wi birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1, r 
outreg2 using "$output/tables/economic_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Female, WI) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","WI") nostars noautosumm se
reg wi birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0, r 
outreg2 using "$output/tables/economic_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Male, WI) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","WI") nostars noautosumm se
outreg using "$output/tables/economic_by_gender.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Occupation using smaller birth cohorts

use "$dhs_data/dhspooled.dta", clear
outreg, clear(dv)
keep if age >= 18
reg highskill birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
est sto m1
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 1") nostars noautosumm se
reg highskill birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year if (birthmo >= 2 & birthmo <= 11), r 
est sto m2
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 2") nostars noautosumm se
reg highskill birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year if (birthmo >= 3 & birthmo <= 10), r 
est sto m3
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 3") nostars noautosumm se
reg highskill birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year if (birthmo >= 4 & birthmo <= 9), r 
est sto m4
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 4") nostars noautosumm se
reg highskill birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year if (birthmo >= 5 & birthmo <= 8), r 
est sto m5
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 5") nostars noautosumm se
outreg2 [m1 m2 m3 m4 m5] using "$output/tables/occupation_smaller_MOB_windows.doc", se keep (birthmo_jul) dec(3) replace title (Occupation using smaller MOB windows) nocons nonotes
outreg using "$output/tables/occupation_smaller_MOB_windows.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* (7) FAMILY FORMATION
**************************************************************************************

**# Bookmark

* Childbearing 

use "$dhs_data/dhswomen.dta", clear // using DHS data
outreg, clear(dv)
drop if agefirstkid15 == .
reg kids birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if age >= 20, r 
outreg2 using "$output/tables/childbearing.doc", se keep (birthmo_jul) dec(3) replace title (Childbearing among adults) ctitle(DHS, Kids) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Kids") nostars noautosumm se
reg agefirstkid20 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if age >= 20, r 
outreg2 using "$output/tables/childbearing.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, < Age 20) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","< Age 20") nostars noautosumm se
reg agefirstkid18 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if age >= 20, r 
outreg2 using "$output/tables/childbearing.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, < Age 18) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","< Age 18") nostars noautosumm se
reg agefirstkid15 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if age >= 20, r 
outreg2 using "$output/tables/childbearing.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, < Age 15) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","< Age 15") nostars noautosumm se
use "$lesotho_census/census2006.dta", clear // using Census data
keep if age >= 18 & age <= 49
drop if birthmo==6 // exclude June-born
reg kids birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age, r 
outreg2 using "$output/tables/childbearing.doc", se keep (birthmo_jul) dec(3) append ctitle(Census, Kids) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Kids") nostars noautosumm se
outreg using "$output/tables/childbearing.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Marriage

use "$dhs_data/dhspooled.dta", clear // using DHS data
outreg, clear(dv)
drop if agefirstmarr15 == .
reg evermarried birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if age >= 20 & age <= 49, r 
outreg2 using "$output/tables/marriage.doc", se keep (birthmo_jul) dec(3) replace title (Marriage among adults) ctitle(DHS, Married) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Married") nostars noautosumm se
reg agefirstmarr20 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if age >= 20 & age <= 49, r 
outreg2 using "$output/tables/marriage.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, < Age 20) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","< Age 20") nostars noautosumm se
reg agefirstmarr18 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if age >= 20 & age <= 49, r  
outreg2 using "$output/tables/marriage.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, < Age 18) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","< Age 18") nostars noautosumm se
reg agefirstmarr15 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if age >= 20 & age <= 49, r 
outreg2 using "$output/tables/marriage.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, < Age 15) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("", "< Age 15") nostars noautosumm se
use "$lesotho_census/census2006.dta", clear // using Census data
keep if age >= 20 & age <= 49
drop if birthmo==6 // exclude June-born
reg evermarried birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r 
outreg2 using "$output/tables/marriage.doc", se keep (birthmo_jul) dec(3) append ctitle(Census, Married) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Married") nostars noautosumm se
reg spouseedu birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r 
outreg2 using "$output/tables/marriage.doc", se keep (birthmo_jul) dec(3) append ctitle(Census, Spouse edu) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Spouse edu") nostars noautosumm se
outreg using "$output/tables/marriage.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Childbearing using smaller window of months of birth

use "$dhs_data/dhswomen.dta", clear
outreg, clear(dv)
keep if age >= 18
reg kids birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year, r 
est sto m1
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 1") nostars noautosumm se
reg kids birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if (birthmo >= 2 & birthmo <= 11), r 
est sto m2
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 2") nostars noautosumm se
reg kids birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if (birthmo >= 3 & birthmo <= 10), r 
est sto m3
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 3") nostars noautosumm se
reg kids birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if (birthmo >= 4 & birthmo <= 9), r 
est sto m4
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 4") nostars noautosumm se
reg kids birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if (birthmo >= 5 & birthmo <= 8), r 
est sto m5
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 5") nostars noautosumm se
outreg2 [m1 m2 m3 m4 m5] using "$output/tables/childbearing_smaller_MOB_windows.doc", se keep (birthmo_jul) dec(3) replace title (Childbearing using smaller MOB windows) nocons nonotes
outreg using "$output/tables/childbearing_smaller_MOB_windows.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Marriage using smaller window of months of birth

use "$dhs_data/dhspooled.dta", clear
outreg, clear(dv)
keep if age >= 18
reg evermarried birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
est sto m1
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 1") nostars noautosumm se 
reg evermarried birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year if (birthmo >= 2 & birthmo <= 11), r 
est sto m2
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 2") nostars noautosumm se
reg evermarried birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year if (birthmo >= 3 & birthmo <= 10), r 
est sto m3
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 3") nostars noautosumm se
reg evermarried birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year if (birthmo >= 4 & birthmo <= 9), r 
est sto m4
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 4") nostars noautosumm se
reg evermarried birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year if (birthmo >= 5 & birthmo <= 8), r 
est sto m5
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 5") nostars noautosumm se
outreg2 [m1 m2 m3 m4 m5] using "$output/tables/marriage_smaller_MOB_windows.doc", se keep (birthmo_jul) dec(3) replace title (childbearing using smaller MOB windows) nocons nonotes
outreg using "$output/tables/marriage_smaller_MOB_windows.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Health by gender

use "$dhs_data/dhspooled.dta", clear
outreg, clear(dv)
keep if age >= 18 & age <= 59
reg evermarried  birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1, r 
outreg2 using "$output/tables/health_by_gender.doc", se keep (birthmo_jul) dec(3) replace title (Health outcomes by gender) ctitle(Female, Married) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Married") nostars noautosumm se
reg evermarried  birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0, r  
outreg2 using "$output/tables/health_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Male, Married) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Married") nostars noautosumm se
reg kids birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1, r 
outreg2 using "$output/tables/health_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, Kids) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Kids") nostars noautosumm se
reg kids birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0, r 
outreg2 using "$output/tables/health_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Male, Kids) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Kids") nostars noautosumm se
reg agefirstkid20 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1 & age >= 20, r 
outreg2 using "$output/tables/health_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, < Age 20) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","< Age 20") nostars noautosumm se
reg agefirstkid20 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0 & age >= 20, r 
outreg2 using "$output/tables/health_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Male, < Age 20) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","< Age 20") nostars noautosumm se
use "$dhs_data/dhshiv.dta", clear
reg hivpos birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1, r 
outreg2 using "$output/tables/health_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, HIV) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","HIV") nostars noautosumm se
reg hivpos birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0, r 
outreg2 using "$output/tables/health_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Male, HIV) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","HIV") nostars noautosumm se
outreg using "$output/tables/health_by_gender.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* Childbearing and marriage for younger and older cohorts

use "$dhs_data/dhswomen.dta", clear
outreg, clear(dv)
reg kids birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1 & age >=18 & age <= 29, r 
outreg2 using "$output/tables/childbearing_and_marriage_by_age.doc", se keep (birthmo_jul) dec(3) replace title (Childbearing and marriage by age group) ctitle(Female, Kids, 18-29 yrs) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Kids") nostars noautosumm se
reg agefirstkid18 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1 & age >=18 & age <= 29, r 
outreg2 using "$output/tables/childbearing_and_marriage_by_age.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, < Age 18, 18-29 yrs) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","< Age 18") nostars noautosumm se
reg evermarried birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1 & age >=18 & age <= 29, r 
outreg2 using "$output/tables/childbearing_and_marriage_by_age.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, Married, 18-29 yrs) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Married") nostars noautosumm se
reg kids birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1 & age >=30 & age <= 49, r 
outreg2 using "$output/tables/childbearing_and_marriage_by_age.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, Kids, 30-49 yrs) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Kids") nostars noautosumm se
reg agefirstkid18 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1 & age >=30 & age <= 49, r 
outreg2 using "$output/tables/childbearing_and_marriage_by_age.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, < Age 18, 30-49 yrs) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","< Age 18") nostars noautosumm se
reg evermarried birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1 & age >=30 & age <= 49, r 
outreg2 using "$output/tables/childbearing_and_marriage_by_age.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, Married, 30-49 yrs) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Married") nostars noautosumm se
outreg using "$output/tables/childbearing_and_marriage_by_age.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* (8) HIV OUTCOMES
**************************************************************************************

**# Bookmark

use "$dhs_data/dhshiv.dta", clear
outreg, clear(dv)
drop if hivpos == . | edu== .
reg edu birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if age >= 18 & age <= 49, r 
outreg2 using "$output/tables/hiv_by_gender.doc", se keep (birthmo_jul) dec(3) replace title (HIV results by gender) ctitle(Both, Schooling) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Schooling") nostars noautosumm se
reg edu birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1 & age >= 18 & age <= 49, r 
outreg2 using "$output/tables/hiv_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, Schooling) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Schooling") nostars noautosumm se
reg edu birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0 & age >= 18 & age <= 49, r 
outreg2 using "$output/tables/hiv_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Male, Schooling) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Schooling") nostars noautosumm se
reg hivpos birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if age >= 18 & age <= 49, r 
outreg2 using "$output/tables/hiv_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Both, HIV) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","HIV") nostars noautosumm se
reg hivpos birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0 & age >= 18 & age <= 49, r 
reg hivpos birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 1 & age >= 18 & age <= 49, r 
outreg2 using "$output/tables/hiv_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, HIV) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","HIV") nostars noautosumm se
reg hivpos birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if fem == 0 & age >= 18 & age <= 49, r 
outreg2 using "$output/tables/hiv_by_gender.doc", se keep (birthmo_jul) dec(3) append ctitle(Male, HIV) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","HIV") nostars noautosumm se
outreg using "$output/tables/hiv_by_gender.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

* HIV using smaller birth cohorts (men)

use "$dhs_data/dhshiv.dta", clear
outreg, clear(dv)
keep if age >= 18 & fem == 0
reg hivpos birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year, r 
est sto m1
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 1") nostars noautosumm se
reg hivpos birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if (birthmo >= 2 & birthmo <= 11), r 
est sto m2
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 2") nostars noautosumm se
reg hivpos birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if (birthmo >= 3 & birthmo <= 10), r 
est sto m3
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 3") nostars noautosumm se
reg hivpos birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if (birthmo >= 4 & birthmo <= 9), r 
est sto m4
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 4") nostars noautosumm se 
reg hivpos birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year if (birthmo >= 5 & birthmo <= 8), r 
est sto m5
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Model 5") nostars noautosumm se
outreg2 [m1 m2 m3 m4 m5] using "$output/tables/hiv_smaller_MOB_windows.doc", se keep (birthmo_jul) dec(3) replace title (HIV results among men using smaller MOB window) nocons nonotes
outreg using "$output/tables/hiv_smaller_MOB_windows.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* (9) INTERGENERATIONAL
**************************************************************************************

**# Bookmark

use "$dhs_data/dhsbh.dta", clear // using DHS full birth history
outreg, clear(dv)
keep if age_mother >= 18
reg alive birthmo_jul_mom c.birthmo_cent_mom i.birthmo_jul_mom#c.birthmo_cent_mom i.age_child i.fem_child i.year , r 
outreg2 using "$output/tables/intergenerational.doc", se keep (birthmo_jul_mom) dec(3) replace title (Intergenerational impacts) ctitle(DHS, Survival) nocons nonotes
margins if birthmo_mom <=6, at(birthmo_cent_mom == 0) post
outreg, merge(dv) ctitle("","Survival") nostars noautosumm se
reg alive birthmo_jul_mom c.birthmo_cent_mom i.birthmo_jul_mom#c.birthmo_cent_mom i.age_child i.fem_child i.year if age_child <= 4, r // under-five survival
outreg2 using "$output/tables/intergenerational.doc", se keep (birthmo_jul_mom) dec(3) append ctitle(DHS, Under-five) nocons nonotes
margins if birthmo_mom <=6, at(birthmo_cent_mom == 0) post
outreg, merge(dv) ctitle("","Under-five") nostars noautosumm se

use "$dhs_data/dhswomen.dta", clear // using DHS women individual recode
keep if age >= 18
gen chdead = v201 - v218
gen chdeadprev = chdead > 0 & chdead < .
reg chdead birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year, r 
outreg2 using "$output/tables/intergenerational.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Deaths) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Deaths") nostars noautosumm se
reg chdeadprev birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.year, r 
outreg2 using "$output/tables/intergenerational.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Anymort) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Anymort") nostars noautosumm se

use "$mics2018_data/micsbh.dta", clear // using MICS full birth history
reg alive birthmo_jul_mom c.birthmo_cent_mom i.birthmo_jul_mom#c.birthmo_cent_mom i.age_child i.fem_child, r 
outreg2 using "$output/tables/intergenerational.doc", se keep (birthmo_jul_mom) dec(3) append ctitle(MICS, Survival) nocons nonotes
margins if birthmo_mom <=6, at(birthmo_cent_mom == 0) post
outreg, merge(dv) ctitle("","Survival") nostars noautosumm se
outreg using "$output/tables/intergenerational.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* (10) TIME IN NURSERY
**************************************************************************************

**# Bookmark

use "$sacmeq_data/sacmeqiii_ii.dta", clear
outreg, clear(dv)
keep if year == 2007
reg nursyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.psex, r
outreg2 using "$output/tables/nursery.doc", se keep (birthmo_jul) dec(3) replace title (Time in nursery in SACMEQ III - 2007) ctitle(Both genders, Nursery) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Both genders") nostars noautosumm se
reg nursyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age if psex == 2, r // female
outreg2 using "$output/tables/nursery.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, Nursery) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Female") nostars noautosumm se
reg nursyrs birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age if psex == 1, r // male
outreg2 using "$output/tables/nursery.doc", se keep (birthmo_jul) dec(3) append ctitle(Male, Nursery) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Male") nostars noautosumm se
outreg using "$output/tables/nursery.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* (11) OPPORTUNITY COSTS
**************************************************************************************

**# Bookmark

* Time use by gender

use "$mics2018_data/mics6fs.dta", clear
outreg, clear(dv)
keep if schage >=10 & schage <= 14
drop if hours_he == . | hours_wafi == . | hours_otherdomestic == . | hours_econ == .
gen hours_domestic = hours_wafi + hours_otherdomestic

reg hours_he birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if fem==1, r 
outreg2 using "$output/tables/opportunity_costs.doc", se keep (birthmo_jul) dec(3) replace title (Opportunity costs among children aged 10-14 years) ctitle(Female, Herding) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Herding") nostars noautosumm se
reg hours_he birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if fem==0, r 
outreg2 using "$output/tables/opportunity_costs.doc", se keep (birthmo_jul) dec(3) append ctitle(Male, Herding) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Herding") nostars noautosumm se
reg hours_domestic birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if fem==1, r 
outreg2 using "$output/tables/opportunity_costs.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, Domestic) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Domestic") nostars noautosumm se
reg hours_domestic birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if fem==0, r 
outreg2 using "$output/tables/opportunity_costs.doc", se keep (birthmo_jul) dec(3) append ctitle(Male, Domestic) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Domestic") nostars noautosumm se
reg hours_econ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if fem==1, r 
outreg2 using "$output/tables/opportunity_costs.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, Econ) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Econ") nostars noautosumm se
reg hours_econ birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if fem==0, r 
outreg2 using "$output/tables/opportunity_costs.doc", se keep (birthmo_jul) dec(3) append ctitle(Male, Econ) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Econ") nostars noautosumm se
reg hazard birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if fem==1, r 
outreg2 using "$output/tables/opportunity_costs.doc", se keep (birthmo_jul) dec(3) append ctitle(Female, Hazard) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Hazard") nostars noautosumm se
reg hazard birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.schage if fem==0, r 
outreg2 using "$output/tables/opportunity_costs.doc", se keep (birthmo_jul) dec(3) append ctitle(Male, Hazard) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Hazard") nostars noautosumm se

outreg using "$output/tables/opportunity_costs.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* (12) MIGRATION
**************************************************************************************

**# Bookmark

use "$dhs_data/dhspooled.dta", clear
outreg, clear(dv)
keep if age >= 18
reg usual birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/migration.doc", se keep (birthmo_jul) dec(3) replace title (Migration outcomes) ctitle(DHS, Usual) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Usual") nostars noautosumm se
reg timesaway1 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r // DHS 2014 only
outreg2 using "$output/tables/migration.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Away) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Away") nostars noautosumm se
reg timesaway birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex, r // DHS 2014 only
outreg2 using "$output/tables/migration.doc", se keep (birthmo_jul) dec(3) append ctitle(DHS, Times) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Times") nostars noautosumm se
use "$southafrica_census/sa_census.dta", clear // using South Africa Census 
keep if age >= 25 & age <= 69
reg ses birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/migration.doc", se keep (birthmo_jul) dec(4) append ctitle(Census, Sesotho) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Sesotho") nostars noautosumm se
reg income birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age i.sex i.year if bornLES==1, r // born in Lesotho
outreg2 using "$output/tables/migration.doc", se keep (birthmo_jul) dec(3) append ctitle(Census, Born in Les) nocons nonotes
margins if birthmo <=6, at(birthmo_cent == 0) post
outreg, merge(dv) ctitle("","Born in Les") nostars noautosumm se
outreg using "$output/tables/migration.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable at lower limit. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* (13) DECOMPOSITION EXERCICE 
**************************************************************************************

**# Bookmark

use "$dhs_data/dhspooled.dta", clear // DHS
outreg, clear(dv)
keep if age >= 18
drop if lit == . | kids == . | evermarried == . | highskill == . | wi == .
reg lit eduyrs c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/decomposition.doc", se keep (eduyrs) dec(3) replace title (Decomposition exercice) ctitle(DHS, Literacy) nocons nonotes
margins, post
outreg, merge(dv) ctitle("","Literacy") nostars noautosumm se
reg kids eduyrs c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/decomposition.doc", se keep (eduyrs) dec(3) append ctitle(DHS, Kids) nocons nonotes
margins, post
outreg, merge(dv) ctitle("","Kids") nostars noautosumm se
reg evermarried eduyrs c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/decomposition.doc", se keep (eduyrs) dec(3) append ctitle(DHS, Marriage) nocons nonotes
margins, post
outreg, merge(dv) ctitle("","Marriage") nostars noautosumm se
reg highskill eduyrs c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/decomposition.doc", se keep (eduyrs) dec(3) append ctitle(DHS, Skill) nocons nonotes
margins, post
outreg, merge(dv) ctitle("","Skill") nostars noautosumm se
reg wi eduyrs c.birthmo_cent i.age i.sex i.year, r 
outreg2 using "$output/tables/decomposition.doc", se keep (eduyrs) dec(3) append ctitle(DHS, WI) nocons nonotes
margins, post
outreg, merge(dv) ctitle("","WI") nostars noautosumm se
use "$mics2018_data/mics2018_wm_mn.dta", clear // MICS 
keep if age >= 18 & age <= 59
rename educ eduyrs
reg lit eduyrs c.birthmo_cent i.age i.sex, r 
outreg2 using "$output/tables/decomposition.doc", se keep (eduyrs) dec(3) append ctitle(MICS, Literacy) nocons nonotes
margins, post
outreg, merge(dv) ctitle("","Literacy") nostars noautosumm se
outreg using "$output/tables/decomposition.doc", replay(dv) addtable rtitle(DV) title("") note("DV shows mean dependent variable. Robust standard errors in parentheses. *** p<0.01, ** p<0.05, * p<0.1")

**************************************************************************************
* CLEAN FOLDER
**************************************************************************************

local workdir "$output/tables/"
cd `workdir'
local datafiles: dir "`workdir'" files "*.txt"
foreach datafile of local datafiles {
        rm `datafile'
}
