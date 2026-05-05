**************************************************************************************
**************************************************************************************
* This do-file contains replication coding for the following article:
* Age at School Entry and Human Capital Development: Evidence from Lesotho
* Authors: De Neve, Moshoeshoe, Bor (2025)
* Stata version 17.0 was used for all analyses.
* Description: Data management/tidying 
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
	global logfile "$log_file/`date_yymmdd'_AEJ_datatsets.log" //path and name of the log file
	log using "${logfile}", replace
	
**************************************************************************************
**************************************************************************************
* PART I. DATASETS
**************************************************************************************
**************************************************************************************

/*
(1) MICS household member dataset
(2) MICS foundational skills (age 7-14 years)
(3) MICS birth history with exact date of birth
(4) MICS women and men datasets pooled
(5) DHS women and men datasets pooled
(6) DHS with HIV biomarkers
(7) DHS children under-five
(8) DHS household member data
(9) DHS full birth history
(10) SACMEQ II and III data
(11) IPUMS Census data Lesotho and South Africa
*/

**************************************************************************************
* (1) MICS HOUSEHOLD MEMBER DATASET
**************************************************************************************

**# Bookmark

use "$mics2018_data/hl.dta", clear // all household members
gen age = HL6
gen sex = HL4
gen fem = 1 if HL4==2
replace fem = 0 if HL4 == 1
gen birthyr = HL5Y if HL5Y <= 2018

* Month of birth

gen birthmo = HL5M if HL5M <= 12
gen birthmo2 = birthmo^2
gen birthmo3 = birthmo^3
gen birthmo4 = birthmo^4
gen birthmo_jul = 1 if birthmo >= 7 & birthmo <= 12
replace birthmo_jul = 0 if birthmo >= 1 & birthmo <= 6
gen birthmo_cent = birthmo - 6.5
gen birthmo_cent2 = birthmo_cent^2

drop if birthyr == . 
drop if birthmo == . 
gen birthmoyr = (birthyr*100)+birthmo

* Age at beginnning of school year

replace schage = schage - 1 if birthmo==1 // adjusting for January births

* Current school attendance (age 3-24 years)

gen current = 1 if ED9 == 1 // currently attending school
replace current = 0 if ED9 == 2

gen level = 0 if current == 0 // currently not enrolled
replace level = 1 if current == 1 & ED10A == 0 // early childhood education
replace level = 2 if current == 1 & ED10A == 1 // primary
replace level = 3 if current == 1 & ED10A == 2 // secondary
replace level = 4 if current == 1 & ED10A == 3 // tertiary

gen grade = 0 if ED10A == 0 // currently attending early childhood education
replace grade = 1 if ED10A == 1 & ED10B == 1
replace grade = 2 if ED10A == 1 & ED10B == 2
replace grade = 3 if ED10A == 1 & ED10B == 3
replace grade = 4 if ED10A == 1 & ED10B == 4
replace grade = 5 if ED10A == 1 & ED10B == 5
replace grade = 6 if ED10A == 1 & ED10B == 6
replace grade = 7 if ED10A == 1 & ED10B == 7
replace grade = 8 if ED10A == 2 & ED10B == 1
replace grade = 9 if ED10A == 2 & ED10B == 2
replace grade = 10 if ED10A == 2 & ED10B == 3
replace grade = 11 if ED10A == 2 & ED10B == 4
replace grade = 12 if ED10A == 2 & ED10B == 5
replace grade = 13 if ED10A == 3 & ED10B == 1
replace grade = 14 if ED10A == 3 & ED10B == 2
replace grade = 15 if ED10A == 3 & ED10B == 3
replace grade = 16 if ED10A == 3 & ED10B == 4
replace grade = 17 if ED10A == 3 & ED10B == 5

gen grade0 = 1 if grade == 0 // currently attending early childhood education
replace grade0 = 0 if grade >= 1 & grade <= 12
gen grade1 = 1 if grade == 1 // currently attending grade = X
replace grade1 = 0 if grade == 0
replace grade1 = 0 if grade >= 2 & grade <= 12
gen grade2 = 1 if grade == 2
replace grade2 = 0 if grade <= 1
replace grade2 = 0 if grade >= 3 & grade <= 12
gen grade3 = 1 if grade == 3
replace grade3 = 0 if grade <= 2
replace grade3 = 0 if grade >= 4 & grade <= 12
gen grade4 = 1 if grade == 4
replace grade4 = 0 if grade <= 3
replace grade4 = 0 if grade >= 5 & grade <= 12
gen grade5 = 1 if grade == 5
replace grade5 = 0 if grade <= 4
replace grade5 = 0 if grade >= 6 & grade <= 12
gen grade6 = 1 if grade == 6
replace grade6 = 0 if grade <= 5
replace grade6 = 0 if grade >= 7 & grade <= 12
gen grade7 = 1 if grade == 7
replace grade7 = 0 if grade <= 6
replace grade7 = 0 if grade >= 8 & grade <= 12
gen grade8 = 1 if grade == 8
replace grade8 = 0 if grade <= 7
replace grade8 = 0 if grade >= 9 & grade <= 12
gen grade9 = 1 if grade == 9
replace grade9 = 0 if grade <= 8
replace grade9 = 0 if grade >= 10 & grade <= 12

gen grade1ormore = 1 if grade >= 1 & grade <= 17 // currently attending grade X or higher
replace grade1ormore = 0 if grade == 0
replace grade1ormore = 0 if current == 0

gen grade2ormore = 1 if grade >= 2 & grade <= 17
replace grade2ormore = 0 if grade < 2
replace grade2ormore = 0 if current == 0

gen grade3ormore = 1 if grade >= 3 & grade <= 17
replace grade3ormore = 0 if grade < 3
replace grade3ormore = 0 if current == 0

gen grade4ormore = 1 if grade >= 4 & grade <= 17
replace grade4ormore = 0 if grade < 4
replace grade4ormore = 0 if current == 0

gen grade5ormore = 1 if grade >= 5 & grade <= 17
replace grade5ormore = 0 if grade < 5
replace grade5ormore = 0 if current == 0

gen grade6ormore = 1 if grade >= 6 & grade <= 17
replace grade6ormore = 0 if grade < 6
replace grade6ormore = 0 if current == 0

gen grade7ormore = 1 if grade >= 7 & grade <= 17
replace grade7ormore = 0 if grade < 7
replace grade7ormore = 0 if current == 0

gen grade8ormore = 1 if grade >= 8 & grade <= 17
replace grade8ormore = 0 if grade < 8
replace grade8ormore = 0 if current == 0

gen grade9ormore = 1 if grade >= 9 & grade <= 17
replace grade9ormore = 0 if grade < 9
replace grade9ormore = 0 if current == 0

gen grade10ormore = 1 if grade >= 10 & grade <= 17
replace grade10ormore = 0 if grade < 10
replace grade10ormore = 0 if current == 0

gen grade11ormore = 1 if grade >= 11 & grade <= 17
replace grade11ormore = 0 if grade < 11
replace grade11ormore = 0 if current == 0

gen grade12ormore = 1 if grade >= 12 & grade <= 17
replace grade12ormore = 0 if grade < 12
replace grade12ormore = 0 if current == 0

* School attendance prior school year (age 3-24 years)

gen grade_lst = 0 if ED16A == 0 // attended early childhood education previous school year
replace grade_lst = 1 if ED16A == 1 & ED16B == 1
replace grade_lst = 2 if ED16A == 1 & ED16B == 2
replace grade_lst = 3 if ED16A == 1 & ED16B == 3
replace grade_lst = 4 if ED16A == 1 & ED16B == 4
replace grade_lst = 5 if ED16A == 1 & ED16B == 5
replace grade_lst = 6 if ED16A == 1 & ED16B == 6
replace grade_lst = 7 if ED16A == 1 & ED16B == 7
replace grade_lst = 8 if ED16A == 2 & ED16B == 1
replace grade_lst = 9 if ED16A == 2 & ED16B == 2
replace grade_lst = 10 if ED16A == 2 & ED16B == 3
replace grade_lst = 11 if ED16A == 2 & ED16B == 4
replace grade_lst = 12 if ED16A == 2 & ED16B == 5
replace grade_lst = 13 if ED16A == 3 & ED16B == 1
replace grade_lst = 14 if ED16A == 3 & ED16B == 2
replace grade_lst = 15 if ED16A == 3 & ED16B == 3
replace grade_lst = 16 if ED16A == 3 & ED16B == 4
replace grade_lst = 17 if ED16A == 3 & ED16B == 5

gen grade_r = 1 if grade == grade_lst & (grade >= 1 & grade <= 17) & (grade_lst >= 0 & grade_lst <= 17) // repeating same school year
replace grade_r = 0 if grade > grade_lst & (grade >= 1 & grade <= 17) & (grade_lst >= 0 & grade_lst <= 17)
replace grade_r = 0 if current == 0

gen both = 1 if current == 0 | grade_r == 1 // out-of school or repeating current grade
replace both = 0 if current == 1 & grade_r == 0 // in-school and not repeating

* Highest level of school ever attained (all ages)

gen educ = 0 if ED4 == 2 // never attended school or early childhood education
replace educ = 0 if ED4 == 1 & ED5A == 0 // highest level attended is early childhood education
replace educ = 1 if ED4 == 1 & ED5A == 1 & ED5B == 1 // attended primary
replace educ = 2 if ED4 == 1 & ED5A == 1 & ED5B == 2
replace educ = 3 if ED4 == 1 & ED5A == 1 & ED5B == 3 
replace educ = 4 if ED4 == 1 & ED5A == 1 & ED5B == 4 
replace educ = 5 if ED4 == 1 & ED5A == 1 & ED5B == 5 
replace educ = 6 if ED4 == 1 & ED5A == 1 & ED5B == 6 
replace educ = 7 if ED4 == 1 & ED5A == 1 & ED5B == 7 
replace educ = 8 if ED4 == 1 & ED5A == 2 & ED5B == 1 // attended secondary
replace educ = 9 if ED4 == 1 & ED5A == 2 & ED5B == 2
replace educ = 10 if ED4 == 1 & ED5A == 2 & ED5B == 3 
replace educ = 11 if ED4 == 1 & ED5A == 2 & ED5B == 4 
replace educ = 12 if ED4 == 1 & ED5A == 2 & ED5B == 5 
replace educ = 13 if ED4 == 1 & ED5A == 3 & ED5B == 1 // attended tertiary
replace educ = 14 if ED4 == 1 & ED5A == 3 & ED5B == 2
replace educ = 15 if ED4 == 1 & ED5A == 3 & ED5B == 3 
replace educ = 16 if ED4 == 1 & ED5A == 3 & ED5B == 4 
replace educ = 17 if ED4 == 1 & ED5A == 3 & ED5B == 5 

gen sec = 1 if ED5A == 2 | ED5A == 3 // highest level attended is secondary
replace sec = 0 if ED4 == 2 | ED5A == 0 | ED5A == 1

* Total years of schooling completed (all ages)

gen eduyrs = educ // years of school actually completed 
replace eduyrs = educ - 1 if ED6 == 2 // highest grade attended not completed

gen AtLeast1 = eduyrs >= 1 & eduyrs < . // completed at least X years of schooling
gen AtLeast2 = eduyrs >= 2 & eduyrs < . 
gen AtLeast3 = eduyrs >= 3 & eduyrs < . 
gen AtLeast4 = eduyrs >= 4 & eduyrs < . 
gen AtLeast5 = eduyrs >= 5 & eduyrs < . 
gen AtLeast6 = eduyrs >= 6 & eduyrs < . 
gen AtLeast7 = eduyrs >= 7 & eduyrs < . 
gen AtLeast8 = eduyrs >= 8 & eduyrs < . 
gen AtLeast9 = eduyrs >= 9 & eduyrs < . 
gen AtLeast10 = eduyrs >= 10 & eduyrs < .
gen AtLeast11 = eduyrs >= 11 & eduyrs < .  
gen AtLeast12 = eduyrs >= 12 & eduyrs < . 
gen AtLeast13 = eduyrs >= 13 & eduyrs < . 
gen AtLeast14 = eduyrs >= 14 & eduyrs < . 
gen AtLeast15 = eduyrs >= 15 & eduyrs < . 

save "$mics2018_data/mics6hl.dta", replace //use this

**************************************************************************************
* (2) MICS FOUNDATIONAL SKILLS DATASET (AGE 7-14 YEARS)
**************************************************************************************

**# Bookmark

use "$mics2018_data/fs.dta", clear
keep CB3 HL4 CB2M schage CB7 CB8A CB8B CB10A CB10B CB4 CB5A CB5B melevel FL28 FL20A FL20B FL220A FL220B FL120A FL120B FLINTRO FLINTROS FL22* FL9 FL7 FL23* FL27_shift FL6A FL24* FL27* CL* FL122* FL25* fsweight CB2Y
gen age = CB3
gen yob = CB2Y if CB2Y <= 2013
label define labels504 1 "Male", modify
label define labels504 2 "Female", modify
gen sex = HL4
gen fem = 1 if HL4 == 2
replace fem = 0 if HL4 == 1

* Month of birth

gen birthmo = CB2M if CB2M <= 12
gen birthmo_jul = 1 if birthmo >= 7 & birthmo <= 12
replace birthmo_jul = 0 if birthmo >= 1 & birthmo <= 6
gen birthmo_cent = birthmo - 6.5
gen birthmo_cent2 = birthmo_cent^2
label define newlab0 0 "Jan-Jun" 1 "Jul-Dec", modify
label values birthmo_jul newlab0

* Age at start of school year

replace schage = schage - 1 if birthmo == 1 // adjusting for January births

egen schagecat2 = cut(schage), at(4,6,8,10,12,14,16,18) 
label define newlab1 4 "4-5" 6 "6-7" 8 "8-9" 10 "10-11" 12 "12-13" 14 "14-15" 16 "16-17", modify
label values schagecat2 newlab1

egen schagecat2_from5 = cut(schage), at(5,7,9,11,13,15,17,19) 
label define newlab2 5 "5-6" 7 "7-8" 9 "9-10" 11 "11-12" 13 "13-14" 15 "15-16" 17 "17", modify
label values schagecat2_from5 newlab2

egen schagecat3_from5 = cut(schage), at(5,8,11,14,17,19) 
label define newlab3 5 "5-7" 8 "8-10" 11 "11-13" 14 "14-16" 17 "17", modify
label values schagecat3_from5 newlab3

* Current school attendance (ages 5-17)

gen current = 1 if CB7 == 1 // currently attending 
replace current = 0 if CB7 == 2
label define newlab4 0 "Out-of-school" 1 "In-school", modify
label values current newlab4

gen grade = 0 if CB8A == 0 // currently attending early childhood education
replace grade = 1 if CB8A == 1 & CB8B == 1 // currently attending grade = X
replace grade = 2 if CB8A == 1 & CB8B == 2
replace grade = 3 if CB8A == 1 & CB8B == 3
replace grade = 4 if CB8A == 1 & CB8B == 4
replace grade = 5 if CB8A == 1 & CB8B == 5
replace grade = 6 if CB8A == 1 & CB8B == 6
replace grade = 7 if CB8A == 1 & CB8B == 7
replace grade = 8 if CB8A == 2 & CB8B == 1
replace grade = 9 if CB8A == 2 & CB8B == 2
replace grade = 10 if CB8A == 2 & CB8B == 3
replace grade = 11 if CB8A == 2 & CB8B == 4
replace grade = 12 if CB8A == 2 & CB8B == 5

egen gradecat2 = cut(grade), at(1, 3, 5, 7, 9, 11, 13) // two-year grade categories
label define newlab5 1 "1-2" 3 "3-4" 5 "5-6" 7 "7-8" 9 "9-10" 11 "11-12", modify
label values gradecat2 newlab5

* School attendance prior school year

gen grade_lst = 0 if CB10A == 0 // early childhood education during previous school year
replace grade_lst = 1 if CB10A == 1 & CB10B == 1
replace grade_lst = 2 if CB10A == 1 & CB10B == 2
replace grade_lst = 3 if CB10A == 1 & CB10B == 3
replace grade_lst = 4 if CB10A == 1 & CB10B == 4
replace grade_lst = 5 if CB10A == 1 & CB10B == 5
replace grade_lst = 6 if CB10A == 1 & CB10B == 6
replace grade_lst = 7 if CB10A == 1 & CB10B == 7
replace grade_lst = 8 if CB10A == 2 & CB10B == 1
replace grade_lst = 9 if CB10A == 2 & CB10B == 2
replace grade_lst = 10 if CB10A == 2 & CB10B == 3
replace grade_lst = 11 if CB10A == 2 & CB10B == 4
replace grade_lst = 12 if CB10A == 2 & CB10B == 5
replace grade_lst = 13 if CB10A == 3 & CB10B == 1
replace grade_lst = 14 if CB10A == 3 & CB10B == 2
replace grade_lst = 15 if CB10A == 3 & CB10B == 3
replace grade_lst = 16 if CB10A == 3 & CB10B == 4
replace grade_lst = 17 if CB10A == 3 & CB10B == 5

gen grade_r = 1 if grade == grade_lst & (grade >= 1 & grade <= 17) & (grade_lst >= 0 & grade_lst <= 17) // repeating same year
replace grade_r = 0 if grade > grade_lst & (grade >= 1 & grade <= 17) & (grade_lst >= 0 & grade_lst <= 17)

* Highest level of school ever attained (all ages)

gen educ = 0 if CB4 == 2 // never attended school or early childhood education
replace educ = 0 if CB4 == 1 & CB5A == 0 // highest level attended is early childhood education
replace educ = 1 if CB4 == 1 & CB5A == 1 & CB5B == 1 // attended primary
replace educ = 2 if CB4 == 1 & CB5A == 1 & CB5B == 2
replace educ = 3 if CB4 == 1 & CB5A == 1 & CB5B == 3 
replace educ = 4 if CB4 == 1 & CB5A == 1 & CB5B == 4 
replace educ = 5 if CB4 == 1 & CB5A == 1 & CB5B == 5 
replace educ = 6 if CB4 == 1 & CB5A == 1 & CB5B == 6 
replace educ = 7 if CB4 == 1 & CB5A == 1 & CB5B == 7 
replace educ = 8 if CB4 == 1 & CB5A == 2 & CB5B == 1 // attended secondary
replace educ = 9 if CB4 == 1 & CB5A == 2 & CB5B == 2
replace educ = 10 if CB4 == 1 & CB5A == 2 & CB5B == 3 
replace educ = 11 if CB4 == 1 & CB5A == 2 & CB5B == 4 
replace educ = 12 if CB4 == 1 & CB5A == 2 & CB5B == 5 
replace educ = 13 if CB4 == 1 & CB5A == 3 & CB5B == 1 // attended tertiary
replace educ = 14 if CB4 == 1 & CB5A == 3 & CB5B == 2
replace educ = 15 if CB4 == 1 & CB5A == 3 & CB5B == 3 
replace educ = 16 if CB4 == 1 & CB5A == 3 & CB5B == 4 
replace educ = 17 if CB4 == 1 & CB5A == 3 & CB5B == 5 

* Foundational literacy skills

/* 
target represents the total number of words read
read_corr represents reading 90% of the text
alit represents response to the literal questions
alnfe represents response to the inferential questions
readskill represents foundational literacy skills among children
 */ 

foreach var in target target_en target_se read_corr alit alnfe readskill readsk_e readsk_s target_num number_read /*
*/ number_dis number_add number_patt numbskill read_corr_e alit_e alnfe_e read_corr_s alit_s alnfe_s {
gen `var'=0 if FL28==1 & age>=7 & age<=14 // for kids who completed interview and ages 7-14 years
}

* calculate the total number of words read correctly in their first language
* the number of words attempted and read correctly in the first story
replace target=FL20A-FL20B
* for the second language, the number of words is separate
replace target_s=FL220A-FL220B
replace target_e=FL120A-FL120B

* those with reading comprehesion are one of the following FLINTRO informs the language
* (1)passed the english exam at first (90% of 64 words)
replace read_corr_e=1 if target>=57.6&target!=.&FLINTRO==1
* (2)passed the sesotho exam at first (90% of 71 words)
replace read_corr_s=1 if target>=63.9&target!=.&FLINTROS==1
* (3)passed the english exam at second (90% of 64 words)
replace read_corr_e=1 if target_e>=57.6&target_e!=.&FLINTROS==1
* (4)passed the sesotho exam at second (90% of 71 words)
replace read_corr_s=1 if target_s>=63.9&target_s!=.&FLINTRO==1

* any of those has reading skills
replace read_corr=1 if read_corr_s==1|read_corr_e==1

* other skills of reading follow the same process
* some questions were reversed for Sesotho C and D
replace alit_e=1 if FL22A==1&FL22B==1&FL22C==1&FLINTRO==1
replace alit_s=1 if FL22A==1&FL22B==1&FL22D==1&FLINTROS==1
replace alit_s=1 if FL222A==1&FL222B==1&FL222D==1&FLINTRO==1
replace alit_e=1 if FL122A==1&FL122B==1&FL122C==1&FLINTROS==1
replace alit=1 if alit_e==1|alit_s==1

replace alnfe_e=1 if FL22D==1&FL22E==1&FLINTRO==1
replace alnfe_s=1 if FL22C==1&FL22E==1&FLINTROS==1
replace alnfe_s=1 if FL222C==1&FL222E==1&FLINTRO==1
replace alnfe_e=1 if FL122D==1&FL122E==1&FLINTROS==1
replace alnfe=1 if alnfe_e==1|alnfe_s==1

* calculate foundational reading skills if all tasks are correct
replace readsk_e=1 if alit_e==1&read_corr_e==1&alnfe_e==1
replace readsk_s=1 if alit_s==1&read_corr_s==1&alnfe_s==1
replace readskill=1 if readsk_e==1|readsk_s==1

gen school_lang="English" if FL9==1
replace school_lang="Sesotho" if FL9==2
gen home_lang="English" if FL7==1
replace home_lang="Sesotho" if FL7==2
replace home_lang="Other" if FL7==3|FL7==4|FL7==6

* Foundational numeracy skills

/* 
target_num represents identifying and reading numbers 
number_read represents identifying and reading numbers correctly
number_dis represents response to number discrimination tasks
number_add represents response to addition tasks
number_patt represents reponse to number pattern tasks
numbskill reperesents foundational numeracy skills among children 
*/ 

foreach var in FL23A FL23B FL23C FL23D FL23E FL23F {
replace target_num=target_num+1 if `var'==1
}
replace number_read=1 if target_num==6
replace number_read=. if FL27_shift == 1 // take into account error during data collection 
replace number_dis=1 if FL24A==1&FL24B==1&FL24C==1&FL24D==1&FL24E==1
replace number_dis=. if FL27_shift == 1 // take into account error during data collection 
replace number_add=1 if FL25A==1&FL25B==1&FL25C==1&FL25D==1&FL25E==1
replace number_add=. if FL27_shift == 1 // take into account error during data collection 
replace number_patt=1 if FL27A==1&FL27B==1&FL27C==1&FL27D==1&FL27E==1
replace number_patt=. if FL27_shift == 1 // take into account error during data collection 

* calculate foundational numeracy skills if all tasks are correct
replace numbskill=1 if number_read==1&number_dis==1&number_add==1&number_patt==1
replace numbskill=. if FL27_shift == 1 // take into account error during data collection 

* Read books at home

gen read = 1 if FL6A == 1 // child reads books at home
replace read = 0 if FL6A == 2

* Opportunity costs

gen econ = 1 if CL1A == 1 | CL1B == 1 | CL1C == 1 | CL1X == 1 // worked or helped in garden or farm, helped in family business, produced or sold articles, engaged in any other income-generating activity - all in past week
replace econ = 0 if CL1A == 2 & CL1B == 2 & CL1C == 2 & CL1X == 2

gen waterfi = 1 if CL7 == 1 | CL9 == 1 // fetching water, firewood
replace waterfi = 0 if CL7 == 2 & CL9 == 2

gen otherdomestic = 1 if CL11A == 1 | CL11B == 1 | CL11C == 1 | CL11D == 1 | CL11E == 1 | CL11F == 1 | CL11X == 1 // shopping, cooking, washing, childcare, caring for others, other household tasks 
replace otherdomestic = 0 if CL11A == 2 & CL11B == 2 & CL11C == 2 & CL11D == 2 & CL11E == 2 & CL11F == 2 & CL11X == 2

gen hours_he = 0 if CL10A == 2
replace hours_he = CL10B if CL10B <= 80

gen hours_wa = 0 if CL7 == 2
replace hours_wa = CL8 if CL8 <= 75
gen hours_fi = 0 if CL9 == 2
replace hours_fi = CL10 if CL10 <= 60
gen hours_wafi = hours_wa + hours_fi

gen hours_otherdomestic = 0 if otherdomestic == 0
replace hours_otherdomestic = CL13 if CL13 <= 80

gen hours_econ = 0 if econ == 0
replace hours_econ = CL3 if CL3 <= 78

* Hazardous activities

gen hazard = 0 
replace hazard = 1 if CL4 == 1 | CL5 == 1 | CL6A == 1 | CL6B == 1 | CL6C == 1 | CL6D == 1 | CL6E == 1 | CL6F == 1 | CL6X == 1

save "$mics2018_data/mics6fs.dta", replace

**************************************************************************************
* (3) MICS BIRTH HISTORY DATASET WITH EXACT DATE OF BIRTH
**************************************************************************************

**# Bookmark

* Merge schooling outcomes with birth history

use "$mics2018_data/hl.dta", clear	// data on schooling from household roster
keep HH1 HH2 HL1 HL4 HL4 HL5M HL5Y HL6 HL6 ED4 ED5A ED5B ED6 ED6A ED9 ED9 ED10A ED10B schage
save "$raw_data/temp.dta", replace

use "$mics2018_data/bh.dta", clear	// birth history with exact date of birth
keep HH1 HH2 BH8 BH4D BH4M BH4Y BH3 BH5 BH6 brthord BH7 WDOB
gen alive = 1 if BH5 == 1
replace alive = 0 if BH5 == 2
gen coreside = 1 if BH7==1
replace coreside = 0 if BH7 == 2
keep if BH7==1 // kids living with mother
duplicates report HH1 HH2 BH8 // identify kids usually living in household
rename BH8 HL1
merge 1:1 HH1 HH2 HL1 using "$raw_data/temp.dta"
keep if _merge==3 
drop _merge

gen age = BH6 // from full birth history
replace schage = . if schage == 995
gen sex = BH3
gen fem = BH3 == 2
gen birthyr = BH4Y if BH4Y <= 2018
gen birthmo = BH4M if BH4M <= 12
gen birthday = BH4D if BH4D <= 31
drop if birthmo == . | birthday == .
gen birthmoyr = (birthyr*100)+birthmo
gen birthmoday = (birthmo*100)+birthday
egen dob = group(birthyr birthmo birthday)

gen birthmo_jul = 1 if birthmo >= 7 & birthmo <= 12
replace birthmo_jul = 0 if birthmo >= 1 & birthmo <= 6

* Education variables

gen current = 1 if ED9 == 1 // currently attending school (ages 3 - 24)
replace current = 0 if ED9 == 2

gen grade = 0 if ED10A == 0 // current school year in early childhood education
replace grade = 1 if ED10A == 1 & ED10B == 1
replace grade = 2 if ED10A == 1 & ED10B == 2
replace grade = 3 if ED10A == 1 & ED10B == 3
replace grade = 4 if ED10A == 1 & ED10B == 4
replace grade = 5 if ED10A == 1 & ED10B == 5
replace grade = 6 if ED10A == 1 & ED10B == 6
replace grade = 7 if ED10A == 1 & ED10B == 7
replace grade = 8 if ED10A == 2 & ED10B == 1
replace grade = 9 if ED10A == 2 & ED10B == 2
replace grade = 10 if ED10A == 2 & ED10B == 3
replace grade = 11 if ED10A == 2 & ED10B == 4
replace grade = 12 if ED10A == 2 & ED10B == 5
replace grade = 13 if ED10A == 3 & ED10B == 1
replace grade = 14 if ED10A == 3 & ED10B == 2
replace grade = 15 if ED10A == 3 & ED10B == 3
replace grade = 16 if ED10A == 3 & ED10B == 4
replace grade = 17 if ED10A == 3 & ED10B == 5

gen grade1ormore = 1 if grade >= 1 & grade <= 17
replace grade1ormore = 0 if grade == 0
replace grade1ormore = 0 if current == 0
gen grade2ormore = 1 if grade >= 2 & grade <= 17
replace grade2ormore = 0 if grade < 2
replace grade2ormore = 0 if current == 0
gen grade3ormore = 1 if grade >= 3 & grade <= 17
replace grade3ormore = 0 if grade < 3
replace grade3ormore = 0 if current == 0
gen grade4ormore = 1 if grade >= 4 & grade <= 17
replace grade4ormore = 0 if grade < 4
replace grade4ormore = 0 if current == 0
gen grade5ormore = 1 if grade >= 5 & grade <= 17
replace grade5ormore = 0 if grade < 5
replace grade5ormore = 0 if current == 0
gen grade6ormore = 1 if grade >= 6 & grade <= 17
replace grade6ormore = 0 if grade < 6
replace grade6ormore = 0 if current == 0
gen grade7ormore = 1 if grade >=7 & grade <= 17
replace grade7ormore = 0 if grade < 7
replace grade7ormore = 0 if current == 0
gen grade8ormore = 1 if grade >=8 & grade <= 17
replace grade8ormore = 0 if grade < 8
replace grade8ormore = 0 if current == 0
gen grade9ormore = 1 if grade >=9 & grade <= 17
replace grade9ormore = 0 if grade < 9
replace grade9ormore = 0 if current == 0
gen grade10ormore = 1 if grade >=10 & grade <= 17
replace grade10ormore = 0 if grade < 10
replace grade10ormore = 0 if current == 0

save "$mics2018_data/mics_day.dta", replace

* Background characteristics of full birth history

use "$mics2018_data/bh.dta", clear	// birth history with exact date of birth
keep BH4D BH4M BH4Y BH5 BH6 BH7 BH8 welevel WDOB WDOI WDOI magebrt brthord BH3_last
gen birthday_child = BH4D if BH4D <= 31
gen birthmo_child = BH4M if BH4M <= 12
gen birthyr_child = BH4Y if BH4Y <= 2018
gen fem_child = 1 if BH3 == 2
replace fem_child = 0 if BH3 == 1
gen birthyr_mom = int((WDOB - 1) / 12) +1900
gen birthmo_mom = WDOB - ((birthyr_mom - 1900) * 12)
gen birthmo_jul_mom = birthmo_mom >= 7 & birthmo_mom <= 12
gen birthmo_cent_mom = birthmo_mom - 6.5
gen alive = 1 if BH5 == 1
replace alive = 0 if BH5 == 2
gen age_child = BH6 if BH6 <= 37
replace age_child = 2018 - birthyr_child if alive == 0 // all kids regardless of survival
gen momsec = 1 if welevel == 2 | welevel == 3
replace momsec = 0 if welevel == 1 
save "$mics2018_data/micsbh.dta", replace

**************************************************************************************
* (4) MICS WOMEN AND MEN DATASETS POOLED
**************************************************************************************

**# Bookmark

* Women

use "$mics2018_data/wm.dta", clear 
keep HH1 HH2 LN WM1 WM3 WMINT WB3M WB3Y WB4 WB5 WB6A WB6B WB7 MT4 WB14 WB6A MT5 MT6A MT6B MT6C MT6D MT6F MT6E MT6G MT6H MT6I MT9 MT10 wmweight LS1 LS2 LS3 LS4 MA* windex5 WB14 CM1 CM11 MA5 MA6 MA7 MA8M MA8Y MA11 WDOM WAGEM WDOBFC WDOBLC CEB CDEAD
gen age = WB4 if WB4<.
gen birthmo = WB3M if WB3M <= 12
gen birthmo_jul = 1 if birthmo >= 7 & birthmo <= 12
replace birthmo_jul = 0 if birthmo >= 1 & birthmo <= 6
gen birthmo_cent = birthmo - 6.5
gen birthmo_cent2 = birthmo_cent^2
label define newlab0 0 "Jan-Jun" 1 "Jul-Dec", modify
label values birthmo_jul newlab0
gen educ = 0 if WB5 == 2 // never attended school or early childhood education
replace educ = 0 if WB5 == 1 & WB6A == 0 // highest level attended is early childhood education
replace educ = 1 if WB5 == 1 & WB6A == 1 & WB6B == 1 // attended primary
replace educ = 2 if WB5 == 1 & WB6A == 1 & WB6B == 2
replace educ = 3 if WB5 == 1 & WB6A == 1 & WB6B == 3 
replace educ = 4 if WB5 == 1 & WB6A == 1 & WB6B == 4 
replace educ = 5 if WB5 == 1 & WB6A == 1 & WB6B == 5 
replace educ = 6 if WB5 == 1 & WB6A == 1 & WB6B == 6 
replace educ = 7 if WB5 == 1 & WB6A == 1 & WB6B == 7 
replace educ = 8 if WB5 == 1 & WB6A == 2 & WB6B == 1 // attended secondary
replace educ = 9 if WB5 == 1 & WB6A == 2 & WB6B == 2
replace educ = 10 if WB5 == 1 & WB6A == 2 & WB6B == 3 
replace educ = 11 if WB5 == 1 & WB6A == 2 & WB6B == 4 
replace educ = 12 if WB5 == 1 & WB6A == 2 & WB6B == 5 
replace educ = 13 if WB5 == 1 & WB6A == 3 & WB6B == 1 // attended tertiary
replace educ = 14 if WB5 == 1 & WB6A == 3 & WB6B == 2
replace educ = 15 if WB5 == 1 & WB6A == 3 & WB6B == 3 
replace educ = 16 if WB5 == 1 & WB6A == 3 & WB6B == 4 
replace educ = 17 if WB5 == 1 & WB6A == 3 & WB6B == 5 
gen lit = 1 if WB14 == 2 | WB14 == 3 // literacy
replace lit = 1 if WB6A == 2 | WB6A == 3 | WB6A == 4 // attained secondary, higher, or vocational
replace lit = 0 if WB14 == 1 // cannot read at all
gen comp = 1 if MT4 == 1 
replace comp = 0 if MT4 == 2
gen inter = 0
replace inter = 1 if MT9 == 1
replace inter = 1 if MT10 >= 1 & MT10 <= 3
gen file = 0
replace file = 1 if MT6A == 1
gen ict = 0 if comp == 0 | MT5 == 0 // ICT skills
replace ict = 0 if MT6A == 2 & MT6B == 2 & MT6C == 2 & MT6D == 2 & MT6E == 2 & MT6F == 2 & MT6G == 2 & MT6H == 2 & MT6I == 2
replace ict = 1 if MT6A == 1 | MT6B == 1 | MT6C == 1 | MT6D == 1 | MT6E == 1 | MT6F == 1 | MT6G == 1 | MT6H == 1 | MT6I == 1
gen fem=1
save "$mics2018_data/mics2018_wm.dta", replace

* Men

use "$mics2018_data/mn.dta", clear
keep HH1 HH2 LN MWM1 MWM3 MWMINT MWB3M MWB3Y MWB4 MWB5 MWB6A MWB6B MWB7 MMT4 MWB14 MWB6A MMT5 MMT6A MMT6B MMT6C MMT6D MMT6F MMT6E MMT6G MMT6H MMT6I MMT9 MMT10 mnweight MLS1 MLS2 MLS3 MLS4 windex5 MWB14 MCM1 MCM11 MMA5 MMA6 MMA7 MMA8M MWDOM MWAGEM MMSTATUS MMA1
gen age = MWB4 if MWB4<.
gen birthmo = MWB3M if MWB3M <= 12
gen birthmo_jul = 1 if birthmo >= 7 & birthmo <= 12
replace birthmo_jul = 0 if birthmo >= 1 & birthmo <= 6
gen birthmo_cent = birthmo - 6.5
gen birthmo_cent2 = birthmo_cent^2
label define newlab0 0 "Jan-Jun" 1 "Jul-Dec", modify
label values birthmo_jul newlab0
gen educ = 0 if MWB5 == 2 // never attended school or early childhood education
replace educ = 0 if MWB5 == 1 & MWB6A == 0 // highest level attended is early childhood education
replace educ = 1 if MWB5 == 1 & MWB6A == 1 & MWB6B == 1 // attended primary
replace educ = 2 if MWB5 == 1 & MWB6A == 1 & MWB6B == 2
replace educ = 3 if MWB5 == 1 & MWB6A == 1 & MWB6B == 3 
replace educ = 4 if MWB5 == 1 & MWB6A == 1 & MWB6B == 4 
replace educ = 5 if MWB5 == 1 & MWB6A == 1 & MWB6B == 5 
replace educ = 6 if MWB5 == 1 & MWB6A == 1 & MWB6B == 6 
replace educ = 7 if MWB5 == 1 & MWB6A == 1 & MWB6B == 7 
replace educ = 8 if MWB5 == 1 & MWB6A == 2 & MWB6B == 1 // attended secondary
replace educ = 9 if MWB5 == 1 & MWB6A == 2 & MWB6B == 2
replace educ = 10 if MWB5 == 1 & MWB6A == 2 & MWB6B == 3 
replace educ = 11 if MWB5 == 1 & MWB6A == 2 & MWB6B == 4 
replace educ = 12 if MWB5 == 1 & MWB6A == 2 & MWB6B == 5 
replace educ = 13 if MWB5 == 1 & MWB6A == 3 & MWB6B == 1 // attended tertiary
replace educ = 14 if MWB5 == 1 & MWB6A == 3 & MWB6B == 2
replace educ = 15 if MWB5 == 1 & MWB6A == 3 & MWB6B == 3 
replace educ = 16 if MWB5 == 1 & MWB6A == 3 & MWB6B == 4 
replace educ = 17 if MWB5 == 1 & MWB6A == 3 & MWB6B == 5 
gen lit = 1 if MWB14 == 2 | MWB14 == 3 // literacy
replace lit = 1 if MWB6A == 2 | MWB6A == 3 | MWB6A == 4 // attained secondary, higher, or vocational
replace lit = 0 if MWB14 == 1 // cannot read at all
gen comp = 1 if MMT4 == 1 
replace comp = 0 if MMT4 == 2
gen inter = 0
replace inter = 1 if MMT9 == 1
replace inter = 1 if MMT10 >= 1 & MMT10 <= 3
gen file = 0
replace file = 1 if MMT6A == 1
gen ict = 0 if comp == 0 | MMT5 == 0 // ICT skills
replace ict = 0 if MMT6A == 2 & MMT6B == 2 & MMT6C == 2 & MMT6D == 2 & MMT6E == 2 & MMT6F == 2 & MMT6G == 2 & MMT6H == 2 & MMT6I == 2
replace ict = 1 if MMT6A == 1 | MMT6B == 1 | MMT6C == 1 | MMT6D == 1 | MMT6E == 1 | MMT6F == 1 | MMT6G == 1 | MMT6H == 1 | MMT6I == 1
gen fem=0
append using "$mics2018_data/mics2018_wm.dta"
gen sex = fem
gen birthyr = MWB3Y if fem == 0
replace birthyr = WB3Y if fem == 1
save "$mics2018_data/mics2018_wm_mn.dta", replace

**************************************************************************************
* (5) DHS WOMEN AND MEN DATASETS POOLED
**************************************************************************************

**# Bookmark

* DHS datasets for women (age 15-49 years)

use "$dhs_data/2014/LSIR71DT/LSIR71FL.DTA", clear // DHS 2014
append using "$dhs_data/2009/LSIR61DT/LSIR61FL.DTA" // DHS 2009-10
append using "$dhs_data/2004/LSIR41DT/LSIR41FL.dta"	// DHS 2004-05
keep caseid v000 v001 v002 v003 v005 v012 v010 v009 v133 v155 v201 v438 v502 v511 v731 v717 v190 v024 s122 v140 v212 v104 v007 v201 v218 v715 v135 v157

gen age = v012
gen yob = v010 if v010 < .
gen birthmo = v009
gen birthmo_cent = v009 - 6.5
gen birthmo_jul = birthmo >= 7 & birthmo <= 12
gen fem = 1

gen eduyrs = v133 // total years of schooling completed
gen lit = 1 if v155 == 2 | v155 == 1 // reads whole or parts of sentence
replace lit = 0 if v155 == 0 
gen read = 0 if v157 == 0 // doesn't read newspaper or magazine
replace read = 1 if v157 == 1 | v157 == 2 | v157 == 3

gen kids = v201 // total kids ever born
gen agefirstkid = v212 if kids < .
gen agefirstkid15 = 1 if agefirstkid <15 & agefirstkid < .
replace agefirstkid15 = 0 if agefirstkid >=15 & agefirstkid < .
replace agefirstkid15 = 0 if kids == 0
gen agefirstkid18 = 1 if agefirstkid <18 & agefirstkid < .
replace agefirstkid18 = 0 if agefirstkid >=18 & agefirstkid < .
replace agefirstkid18 = 0 if kids == 0
gen agefirstkid20 = 1 if agefirstkid <20 & agefirstkid < .
replace agefirstkid20 = 0 if agefirstkid >=20 & agefirstkid < .
replace agefirstkid20 = 0 if kids == 0

gen evermarried = 1 if v502 == 1 | v502 == 2 // marriage
replace evermarried = 0 if v502 == 0
gen agefirstmarr = v511 if evermarried == 1
gen agefirstmarr15 = 1 if agefirstmarr <15 & agefirstmarr < .
replace agefirstmarr15 = 0 if agefirstmarr >=15 & agefirstmarr < .
replace agefirstmarr15 = 0 if evermarried == 0
gen agefirstmarr18 = 1 if agefirstmarr <18 & agefirstmarr < .
replace agefirstmarr18 = 0 if agefirstmarr >=18 & agefirstmarr < .
replace agefirstmarr18 = 0 if evermarried == 0
gen agefirstmarr20 = 1 if agefirstmarr <20 & agefirstmarr < .
replace agefirstmarr20 = 0 if agefirstmarr >=20 & agefirstmarr < .
replace agefirstmarr20 = 0 if evermarried == 0

gen height = v438 if v438 < 2000 // measured height in cm
replace height = height/10

gen spousedu = v715 if v715 <= 18

gen year = v007 // survey year

gen usual = 1 if v135 == 1 // usual resident
replace usual = 0 if v135 == 2 // visitor

save "$dhs_data/dhswomen.dta", replace

* DHS datasets for men (age 15-49 years)

use "$dhs_data/2014/LSMR71DT/LSMR71FL.DTA", clear // DHS 2014
append using "$dhs_data/2009/LSMR61DT/LSMR61FL.DTA" // DHS 2009-10
append using "$dhs_data/2004/LSMR41DT/LSMR41FL.dta" // DHS 2004-05
keep mcaseid mv000 mv001 mv002 mv003 mv005 mv012 mv010 mv009 mv133 mv155 mv201 mv502 mv502 mv731 mv717 mv190 mv104 sm122 mv102 mv511 mv024 mv007 mv212 mv135 mv157 mv034_1

gen age = mv012
gen yob = mv010 if mv010 < .
gen birthmo = mv009
gen birthmo_cent = mv009 - 6.5
gen birthmo_jul = birthmo >= 7 & birthmo <= 12
gen fem = 0

gen eduyrs = mv133 // total years of schooling completed
gen lit = 1 if mv155 == 2 | mv155 == 1 // reads whole or parts of sentence
replace lit = 0 if mv155 == 0 
gen read = 0 if mv157 == 0 // doesn't read newspaper or magazine
replace read = 1 if mv157 == 1 | mv157 == 2 | mv157 == 3

gen kids = mv201
gen agefirstkid = mv212 if kids < .
gen agefirstkid15 = 1 if agefirstkid <15 & agefirstkid < .
replace agefirstkid15 = 0 if agefirstkid >=15 & agefirstkid < .
replace agefirstkid15 = 0 if kids == 0
gen agefirstkid18 = 1 if agefirstkid <18 & agefirstkid < .
replace agefirstkid18 = 0 if agefirstkid >=18 & agefirstkid < .
replace agefirstkid18 = 0 if kids == 0
gen agefirstkid20 = 1 if agefirstkid <20 & agefirstkid < .
replace agefirstkid20 = 0 if agefirstkid >=20 & agefirstkid < .
replace agefirstkid20 = 0 if kids == 0

gen evermarried = 1 if mv502 == 1 | mv502 == 2 // marriage
replace evermarried = 0 if mv502 == 0
gen agefirstmarr = mv511 if evermarried == 1
gen agefirstmarr15 = 1 if agefirstmarr <15 & agefirstmarr < .
replace agefirstmarr15 = 0 if agefirstmarr >=15 & agefirstmarr < .
replace agefirstmarr15 = 0 if evermarried == 0
gen agefirstmarr18 = 1 if agefirstmarr <18 & agefirstmarr < .
replace agefirstmarr18 = 0 if agefirstmarr >=18 & agefirstmarr < .
replace agefirstmarr18 = 0 if evermarried == 0
gen agefirstmarr20 = 1 if agefirstmarr <20 & agefirstmarr < .
replace agefirstmarr20 = 0 if agefirstmarr >=20 & agefirstmarr < .
replace agefirstmarr20 = 0 if evermarried == 0

gen year = mv007 // survey year

gen usual = 1 if mv135 == 1 // usual resident
replace usual = 0 if mv135 == 2 // visitor

save "$dhs_data/dhsmen.dta", replace

use "$dhs_data/dhswomen.dta", clear // appending women and men files
append using "$dhs_data/dhsmen.dta"

gen sex = fem
gen birthmo2 = birthmo^2

gen AtLeast1 = eduyrs >= 1 & eduyrs < . // completed at least X years of schooling
gen AtLeast2 = eduyrs >= 2 & eduyrs < . 
gen AtLeast3 = eduyrs >= 3 & eduyrs < . 
gen AtLeast4 = eduyrs >= 4 & eduyrs < . 
gen AtLeast5 = eduyrs >= 5 & eduyrs < . 
gen AtLeast6 = eduyrs >= 6 & eduyrs < . 
gen AtLeast7 = eduyrs >= 7 & eduyrs < . 
gen AtLeast8 = eduyrs >= 8 & eduyrs < . 
gen AtLeast9 = eduyrs >= 9 & eduyrs < . 
gen AtLeast10 = eduyrs >= 10 & eduyrs < .
gen AtLeast11 = eduyrs >= 11 & eduyrs < .  
gen AtLeast12 = eduyrs >= 12 & eduyrs < . 
gen AtLeast13 = eduyrs >= 13 & eduyrs < . 
gen AtLeast14 = eduyrs >= 14 & eduyrs < . 
gen AtLeast15 = eduyrs >= 15 & eduyrs < . 

gen worked12 = 1 if (v731 == 1 | v731 == 2) | (mv731 == 1 | mv731 == 2) // employment
replace worked12 = 0 if v731 == 0 | mv731 == 0

gen highskill = 1 if (v717 >= 1 & v717 <= 3) | (mv717 >= 1 & mv717 <= 3) // prof, tech, manag, clerical, sales
replace highskill = 0 if (v717 == 0 | mv717 == 0) | (v717 >=4 & v717 <=9) | (mv717 >=4 & mv717 <=9) | worked12 == 0 // agric, domestic, manual, not working

gen agri = 1 if (v717 == 4 | v717 == 5) | (mv717 == 4 | mv717 == 5) | (v717 == 8 | v717 == 9) | (mv717 == 8 | mv717 == 9) // agric, manual 
replace agri = 0 if (v717 == 0 | mv717 == 0) | (v717 >=1 & v717 <=3) | (mv717 >=1 & mv717 <=3) | (v717 == 6 | v717 == 7) | ///
(mv717 == 6 | mv717 == 7) | worked12 == 0 // prof, tech, manag, clerical, sales, domestic, not working

gen wi = v190 if sex == 1 // household wealth index
replace wi = mv190 if sex == 0

gen birthdistr = 99 // missing for most
replace birthdistr = v024 if v104 == 95 | (v104 == age) & fem == 1 // based on years lived in current locality
replace birthdistr = mv024 if mv104 == 95 | (mv104 == age) & fem == 0
tabulate birthdistr, generate(b)
gen maseru=1 if birthdistr==4
replace maseru=0 if birthdistr!=4 & birthdistr <99

gen timesaway = sm122 if fem==0 & year==2014 // times away from home for 3+ months in past 5 yrs
replace timesaway = s122 if fem==1 & year==2014

gen timesaway1 = 1 if timesaway >=1 & timesaway <= 20
replace timesaway1 = 0 if timesaway == 0

gen urban = 1 if v140 == 1 & fem == 1
replace urban = 0 if v140 == 2 & fem == 1
replace urban  = 1 if mv102 == 1 & fem == 0
replace urban  = 0 if mv102 == 2 & fem == 0

save "$dhs_data/dhspooled.dta", replace

**************************************************************************************
* (6) DHS DATA WITH HIV BIOMARKERS
**************************************************************************************

**# Bookmark

* Women

use "$dhs_data/2014/LSIR71DT/LSIR71FL.DTA", clear // DHS 2014
keep caseid v000 v001 v002 v003 v004 v005 v007 v009 v010 v011 v012 v024 v025 v133
save "$dhs_data/temp.dta", replace
use "$dhs_data/2014/LSAR72DT/LSAR72FL.DTA", clear // adding HIV biomarkers for women
keep hivclust hivnumb hivline hiv03 hiv05 sviral
rename hivclust v001 // cluster number
rename hivnum v002 // household number
rename hivline v003 // line number
merge 1:m v001 v002 v003 using "$dhs_data/temp.dta"
keep if _merge == 3
drop _merge
gen year = v007 // survey year
save "$dhs_data/women2014hiv.dta", replace

use "$dhs_data/2009/LSIR61DT/LSIR61FL.DTA", clear // DHS 2009-10
keep caseid v000 v001 v002 v003 v004 v005 v007 v009 v010 v011 v012 v024 v025 v133
save "$dhs_data/temp.dta", replace
use "$dhs_data/2009/LSAR61DT/LSAR61FL.DTA", clear // adding HIV biomarkers for women
keep hivclust hivnumb hivline hiv03 hiv05
rename hivclust v001 // cluster number
rename hivnum v002 // household number
rename hivline v003 // line number
merge 1:m v001 v002 v003 using "$dhs_data/temp.dta"
keep if _merge == 3
drop _merge
gen year = v007 // survey year
append using "$dhs_data/women2014hiv.dta"
save "$dhs_data/women2009_14hiv.dta", replace

use "$dhs_data/2004/LSIR41DT/LSIR41FL.dta", clear // DHS 2004-05
keep caseid v000 v001 v002 v003 v004 v005 v007 v009 v010 v011 v012 v024 v025 v133
save "$dhs_data/temp.dta", replace
use "$dhs_data/2004/LSAR41DT/lsar41fl.dta", clear // adding HIV biomarkers for women
keep hivclust hivnumb hivline hiv03 hiv05
rename hivclust v001 // cluster number
rename hivnum v002 // household number
rename hivline v003 // line number
merge 1:m v001 v002 v003 using "$dhs_data/temp.dta"
keep if _merge == 3
drop _merge
gen year = v007 // survey year
append using "$dhs_data/women2009_14hiv.dta"
gen age = v012
gen yob = v010 if v010 < .
gen eduyrs = v133
gen birthmo = v009
gen birthmo_cent = v009 - 6.5
gen birthmo_jul = birthmo >= 7 & birthmo <= 12
gen fem = 1
save "$dhs_data/women_hiv.dta", replace

* Men

use "$dhs_data/2014/LSMR71DT/LSMR71FL.DTA", clear // DHS 2014
keep mcaseid mv000 mv001 mv002 mv003 mv004 mv005 mv007 mv009 mv010 mv011 mv012 mv024 mv025 mv133
save "$dhs_data/temp.dta", replace
use "$dhs_data/2014/LSAR72DT/LSAR72FL.DTA", clear // adding HIV biomarkers for men
keep hivclust hivnumb hivline hiv03 hiv05 sviral
rename hivclust mv001 // cluster number
rename hivnum mv002 // household number
rename hivline mv003 // line number
merge 1:m mv001 mv002 mv003 using "$dhs_data/temp.dta"
keep if _merge == 3
drop _merge
gen year = mv007 // survey year
save "$dhs_data/men2014hiv.dta", replace

use "$dhs_data/2009/LSMR61DT/LSMR61FL.DTA", clear // DHS 2009-10
keep mcaseid mv000 mv001 mv002 mv003 mv004 mv005 mv007 mv009 mv010 mv011 mv012 mv024 mv025 mv133
save "$dhs_data/temp.dta", replace
use "$dhs_data/2009/LSAR61DT/LSAR61FL.DTA", clear // adding HIV biomarkers for men
keep hivclust hivnumb hivline hiv03 hiv05
rename hivclust mv001 // cluster number
rename hivnum mv002 // household number
rename hivline mv003 // line number
merge 1:m mv001 mv002 mv003 using "$dhs_data/temp.dta"
keep if _merge == 3
drop _merge
gen year = mv007 // survey year
append using "$dhs_data/men2014hiv.dta"
save "$dhs_data/men2009_14hiv.dta", replace

use "$dhs_data/2004/LSMR41DT/LSMR41FL.dta", clear // DHS 2004-05
keep mcaseid mv000 mv001 mv002 mv003 mv004 mv005 mv007 mv009 mv010 mv011 mv012 mv024 mv025 mv133
save "$dhs_data/temp.dta", replace
use "$dhs_data/2004/LSAR41DT/lsar41fl.dta", clear // adding HIV biomarkers for men
keep hivclust hivnumb hivline hiv03 hiv05
rename hivclust mv001 // cluster number
rename hivnum mv002 // household
rename hivline mv003 // line number
merge 1:m mv001 mv002 mv003 using "$dhs_data/temp.dta"
keep if _merge == 3
drop _merge
gen year = mv007 // survey year
append using "$dhs_data/men2009_14hiv.dta"
gen birthmo = mv009
gen birthmo_cent = mv009 - 6.5
gen birthmo_jul = birthmo >= 7 & birthmo <= 12
gen eduyrs = mv133
gen age = mv012
gen yob = mv010 if mv010 < .
gen fem = 0
save "$dhs_data/men_hiv.dta", replace

use "$dhs_data/women_hiv.dta", clear
append using "$dhs_data/men_hiv.dta"
gen HIVwght=hiv05/1000000
gen hivpos = 1 if hiv03 == 1
replace hivpos = 0 if hiv03 == 0
gen sex = fem
save "$dhs_data/dhshiv.dta", replace

**************************************************************************************
* (7) DHS DATA CHILDREN UNDER-FIVE
**************************************************************************************

**# Bookmark

use "$dhs_data/2014/LSKR71DT/LSKR71FL.DTA", clear
append using "$dhs_data/2009/LSKR61DT/LSKR61FL.DTA"
append using "$dhs_data/2004/LSKR41DT/LSKR41FL.dta"

keep v007 v009 v010 v011 v012 v102 v024 v107 v149 v190 b1 b2 b3 b4 b5 b6 b8 bord m18 m19 h10 hw1 hw2 hw3 hw4 hw5 hw6 hw7 hw8 /// 
hw9 hw10 hw11 hw12 hw13 hw15 hw16 hw55 hw56 hw57 hw70 hw71 hw72 hw73 h22 h11 hw70 hw71 h31 hw8 hw5 v005 v107 v133 v149

gen year = v007 // survey year
gen birthweight = m19 if m19 < 7000
gen evervacc = 1 if h10 == 1
replace evervacc = 0 if h10 == 0
gen weight = hw2/10 if hw2 < 250
gen height = hw3/10 if hw3 < 1500
gen anemia = 1 if hw57 == 1 | hw57 == 2 | hw57 == 3
replace anemia = 0 if hw57 == 4
gen fever = 1 if h22 == 1
replace fever = 0 if h22 == 0
gen diarr = 1 if h11 == 2
replace diarr = 0 if h11 == 0
gen cough = 1 if h31 == 2
replace cough = 0 if h31 == 0

gen stunt = 0 if (hw70 >= -200 & hw70 <= 600) & (year >= 2009 & year <= 2014)
replace stunt = 0 if (hw5 >= -200 & hw5 <= 600) & (year == 2004)
replace stunt = 1 if (hw70 < -200) & (year >= 2009 & year <= 2014)
replace stunt = 1 if hw5 < -200 & year == 2004

gen underwght = 0 if hw71 >= -200 & hw71 <= 600 & year >= 2009 & year <= 2014
replace underwght = 1 if hw71 < -200 & year >= 2009 & year <= 2014
replace underwght = 0 if hw8 >= -200 & hw8 <= 600 & year == 2004
replace underwght = 1 if hw8 < -200 & year == 2004

gen sampleweight = (v005*100000)+year
gen age = b8 // age of child
drop if age == .
gen sex = b4
gen birthmo = b1
gen birthmo_jul = birthmo >= 7 & birthmo <= 12 if birthmo < .
gen birthmo_cent = birthmo - 6.5
gen birthmo_cent2 = birthmo_cent^2
gen bord1 = bord==1 // first-born kid
gen wi = v190 // household wealth
gen momedu = v133 if v133 < .
gen momage = v012 if v012 < .
gen momprimary = 1 if v149 == 2 | v149 == 3 | v149 == 4 | v149 == 5
replace momprimary = 0 if v149 == 0 | v149 == 1
gen birthday = hw16 if hw16 <= 31

save "$dhs_data/dhskids.dta", replace

**************************************************************************************
* (8) DHS HOUSEHOLD MEMBER DATA
**************************************************************************************

**# Bookmark

use "$dhs_data/2014/LSPR71DT/LSPR71FL.DTA", clear
append using "$dhs_data/2009/LSPR61DT/LSPR61FL.DTA"
append using "$dhs_data/2004/LSPR41DT/LSPR41FL.dta"

keep hhid hvidx hv000 hv001 hv002 hv003 hv005 hv007 hv105 ha32 hv104 hb32 hc30 hv121 hv122 hv123 hv116 hv247 sh110k hv270 hv243a hv246 /// 
hv244 hv102 sh06 ha3 hb3 hv206 sh05 hv108 sh04

gen year = hv007 // survey year

gen age = hv105 if hv105 <= 94

gen yob = int((ha32 - 1)/12) if hv104 == 2 // year of birth among women
replace yob = yob + 1900 if hv104 == 2
gen birthmo = ha32 - ((yob - 1900)*12) if hv104 == 2

replace yob = int((hb32 - 1)/12) if hv104 == 1 // year of birth among men
replace yob = yob + 1900 if hv104 == 1
replace birthmo = hb32 - ((yob - 1900)*12) if hv104 == 1 

replace birthmo = hc30 if hc30 < .

gen birthmo_jul = birthmo >= 7 & birthmo <= 12 if birthmo < .
gen birthmo_cent = birthmo - 6.5
gen birthmo_cent2 = birthmo_cent^2

gen fem = 1 if hv104 == 2
replace fem = 0 if hv104 == 1
gen sex = fem

gen currentatt = 0 if hv121 == 0 | hv121 == 2 // currently attending school
replace currentatt = 1 if hv121 == 1  

gen currentlevel = hv122 if hv122 <= 3

gen currentlevel_no = 0
replace currentlevel_no = 1 if hv122 == 0
gen currentlevel_prim = 0
replace currentlevel_prim = 1 if hv122 == 1
gen currentlevel_sec = 0 
replace currentlevel_sec = 1 if hv122 == 2
gen currentlevel_ter = 0 
replace currentlevel_ter = 1 if hv122 == 3

gen grade = 1 if hv122 == 1 & hv123 == 1
replace grade = 2 if hv122 == 1 & hv123 == 2
replace grade = 3 if hv122 == 1 & hv123 == 3
replace grade = 4 if hv122 == 1 & hv123 == 4
replace grade = 5 if hv122 == 1 & hv123 == 5
replace grade = 6 if hv122 == 1 & hv123 == 6
replace grade = 7 if hv122 == 1 & hv123 == 7
replace grade = 8 if hv122 == 2 & hv123 == 1
replace grade = 9 if hv122 == 2 & hv123 == 2
replace grade = 10 if hv122 == 2 & hv123 == 3
replace grade = 11 if hv122 == 2 & hv123 == 4
replace grade = 12 if hv122 == 2 & hv123 == 5

gen eduyrs = hv108 if hv108 <= 21

drop if age < 12 & currentlevel_sec == 1 
drop if age < 12 & currentlevel_ter == 1

gen evermarried = 1 if hv116 == 1 | hv116 == 2
replace evermarried = 0 if hv116 == 0

gen bank = 1 if hv247 == 1 // has bank account
replace bank = 0 if hv247 == 0
gen wi = hv270 // household wealth index
gen internet = sh110k
gen elec = hv206
gen cellph = hv243a
gen livestock = 1 if hv246 == 1
replace livestock = 0 if hv246 == 0
gen land = 1 if hv244 == 1
replace land = 0 if hv244 == 0

gen usual = 1 if hv102 == 1 // usual HH resident
replace usual = 0 if hv102 == 0

gen liveSA = 1 if sh06==2 & (year == 2009 | year == 2010 | year == 2014) // not usual resident and lives in South Afr
replace liveSA = 1 if sh05==1 & (year == 2004 | year == 2005) // not usual resident and lives in South Afr
replace liveSA = 0 if sh06==1 | (sh06 >=3 & sh06 <=45) & (year ==2009 | year == 2010 | year == 2014) // not usual resident but lives in Lesotho or other country which is not South Afr
replace liveSA = 0 if sh04 == 2 & (year == 2004 | year == 2005) // not usual resident but lives in Lesotho or other country which is not South Afr
replace liveSA = 0 if hv102 == 1 // usual resident

gen height = ha3 if fem==1 & ha3 < 2000
replace height = hb3 if fem==0 & hb3 < 2000
replace height = height/10

save "$dhs_data/dhspooledPR.dta", replace

**************************************************************************************
* (9) DHS FULL BIRTH HISTORY
**************************************************************************************

**# Bookmark

use "$dhs_data/2014/LSBR71DT/LSBR71FL.DTA", clear
append using "$dhs_data/2009/LSBR61DT/LSBR61FL.DTA"
append using "$dhs_data/2004/LSBR41DT/LSBR41FL.dta"
keep v000 v007 v009 v010 v011 v012 v107 v106 bord b1 b2 b3 b4 b5 b6 b7 b8 b9 hw16 v201 v218 v133 v005 v007
gen year = v007 // survey year
gen birthmo_jul_child = b1 >= 7 & b1 <= 12 // month of birth child
gen birthmo_cent_child = b1 - 6.5
gen birthmo_mom = v009 // month of birth mother
gen birthmo_jul_mom = birthmo_mom >= 7 & birthmo_mom <= 12
gen birthmo_cent_mom = birthmo_mom - 6.5
gen fem_child = 1 if b4 == 2
replace fem_child = 0 if b4 == 1
gen age_mother = v012
gen age_child = b8 
replace age_child = year - b2 if b2 <= year // all kids regardless of survival
gen birthyr_child = b2
gen alive = 1 if b5 == 1
replace alive = 0 if b5 == 0
gen chdead = v201 - v218
gen chdeadprev = chdead > 0 & chdead < .
drop if age_child == .
save "$dhs_data/dhsbh.dta", replace

**************************************************************************************
* (10) SACMEQ II AND III
**************************************************************************************

**# BookmarK

use "$sacmeq_data/2007/SACMEQ III - 15_final.dta", clear // SACMEQ III (2007)
keep if country == "LES"
keep country pupil rcorp mcorp hcorp zmalevp zralevp zralocp zmalocp zhalocp pbyear pbmonth pbday psex prepeat prepeat6 pnursery zpnurser

label variable rcorp "correct reading responses by pupil"
label variable mcorp "correct math responses by pupils"
label variable hcorp "correct health responses by pupils"
label variable zmalevp "standardized math level pupils" 
label variable zralevp "standardized reading level pupils"
label define PSEX 1 "Male", modify
label define PSEX 2 "Female", modify

gen year = 2007 // survey year
gen yob = pbyear + 1900
gen birthmo = pbmonth if pbmonth <.
gen age = 2007 - yob
gen schoolage = (year - yob) - 1
gen birthmo_cent = birthmo - 6.5

gen birthmo_jul = 1 if birthmo >= 7 & birthmo <= 12
replace birthmo_jul = 0 if birthmo >= 1 & birthmo <= 6
label define newlab0 0 "Jan-Jun" 1 "Jul-Dec", modify
label values birthmo_jul newlab0

gen everrepeated = 1 if prepeat == 2 | prepeat == 3 | prepeat == 4 // grade repetition
replace everrepeated = 0 if prepeat == 1

gen repeat6 = 1 if prepeat6 == 2
replace repeat6 = 0 if prepeat6 == 1

gen ece = 0 if pnursery == 1 | pnursery == 2 // early childhood education
replace ece = 1 if pnursery == 3
replace ece = 2 if pnursery == 4
replace ece = 3 if pnursery == 5

save "$sacmeq_data/2007/sacmeqiii.dta", replace

use "$sacmeq_data/2000/merg3les.dta", clear // SACMEQ II (2000)
keep country idpupil pbday pbmonth pbyear psex prepeat prepeat6 pfbirth pfsex zralocp zrelocp zmalocp zmelocp zralevp zmalevp zprepeat zpagemon

gen year = 2000 // survey year
gen birthmo = pbmonth if pbmonth <.
gen yob = pbyear + 1900
gen age = year - yob
gen schoolage = (year - yob) - 1
gen birthmo_cent = birthmo - 6.5

gen birthmo_jul = 1 if birthmo >= 7 & birthmo <= 12
replace birthmo_jul = 0 if birthmo >= 1 & birthmo <= 6
label define newlab0 0 "Jan-Jun" 1 "Jul-Dec", modify
label values birthmo_jul newlab0

gen everrepeated = 1 if zprepeat == 1 // grade repetition
replace everrepeated = 0 if zprepeat == 0

append using "$sacmeq_data/2007/sacmeqiii.dta" // pooling SACMEQ II and III

gen nursyrs = 0 if (zpnurser == 0 | zpnurser == 1) & year == 2007 // time in nursery
replace nursyrs = 1 if zpnurser == 2 & year == 2007 // one year
replace nursyrs = 2 if zpnurser == 3 & year == 2007 // two years
replace nursyrs = 3 if zpnurser == 4 & year == 2007 // three years or more

gen presch = 0 if zpnurser == 0
replace presch = 1 if zpnurser >=1 & zpnurser <= 4
gen presch_oneyr = 0 if zpnurser == 0 | zpnurser == 1
replace presch_oneyr = 1 if zpnurser >=2 & zpnurser <= 4
gen presch_twoyr = 0 if zpnurser >=0 & zpnurser <= 2
replace presch_twoyr = 1 if zpnurser >=3 & zpnurser <= 4

rename zralocp standard_reading_score
rename zmalocp standard_math_score
rename zhalocp standard_hiv_score
rename zralevp standard_reading_level
rename zmalevp standard_math_level

save "$sacmeq_data/sacmeqiii_ii.dta", replace

**************************************************************************************
* (11) CENSUS DATA
**************************************************************************************

**# Bookmark

* Census data for Lesotho

use "$lesotho_census/census lesotho.dta", clear // birthmonth not available for census 1996
keep country year serial pernum age birthmo birthyr sex yrschool yrschool_sp school educls lit chborn eldch marst agemarr empstat occisco electric watsup cell tv autos refrig chdead chborn lastbmort chdead migrate0 ls2006a_work10yr migrate0 migctry0 ls2006a_workdur chsurv ls2006a_lit urban
keep if year == 2006 // Census 2006 
drop if birthmo == .
gen birthmo_jul = birthmo >= 7 & birthmo <= 12
gen birthmo_cent = birthmo - 6.5
gen birthmo_cent2 = birthmo_cent^2
gen june = birthmo==6
gen fem = 1 if sex == 2
replace fem = 0 if sex == 1

gen everattprim = school == 1 | school == 3 // ever attended primary school
replace everattprim = 0 if educls==12 // preschool

gen eduyrs = yrschool if yrschool >= 0 & yrschool <= 14 // total years of schooling completed

gen atleast1 = eduyrs >= 1 & eduyrs < . // completed at least X years of schooling
gen atleast2 = eduyrs >= 2 & eduyrs < . 
gen atleast3 = eduyrs >= 3 & eduyrs < . 
gen atleast4 = eduyrs >= 4 & eduyrs < . 
gen atleast5 = eduyrs >= 5 & eduyrs < . 
gen atleast6 = eduyrs >= 6 & eduyrs < . 
gen atleast7 = eduyrs >= 7 & eduyrs < . 
gen atleast8 = eduyrs >= 8 & eduyrs < . 
gen atleast9 = eduyrs >= 9 & eduyrs < . 
gen atleast10 = eduyrs >= 10 & eduyrs < .
gen atleast11 = eduyrs >= 11 & eduyrs < .  
gen atleast12 = eduyrs >= 12 & eduyrs < . 
gen atleast13 = eduyrs >= 13 & eduyrs < . 

gen spouseedu = yrschool_sp if yrschool_sp <= 13 // spousal educational attainment

gen literacy = 1 if lit == 2
replace literacy = 0 if lit == 1

gen lit_ease = 1 if ls2006a_lit == 1
replace lit_ease = 0 if ls2006a_lit == 2 | ls2006a_lit == 3

gen kids = chborn if chborn <= 15
gen agefirstkid = eldch if eldch < 51

gen evermarried = 1 if marst == 2 | marst == 3 | marst == 4
replace evermarried = 0 if marst == 1
gen agemarried = agemarr if agemarr > 0 & agemarr < .
gen agefirstmarr18 = 1 if agemarried <18 & agemarried < .
replace agefirstmarr18 = 0 if agemarried >=18 & agemarried < .
replace agefirstmarr18 = 0 if evermarried == 0
gen agefirstmarr20 = 1 if agemarried <20 & agemarried < .
replace agefirstmarr20 = 0 if agemarried >=20 & agemarried < .
replace agefirstmarr20 = 0 if evermarried == 0

gen employed = 1 if empstat==1 // employment
replace employed = 0 if empstat == 2 | empstat == 3 // unemployed, inactive

gen skill = 1 if occisco >=1 & occisco <= 5 // legislators, managers, prof, tech, clerks, service workers, sales 
replace skill = 0 if occisco >=6 & occisco <= 10 // agri, crafts, elementary occupations, military
replace skill = 0 if employed == 0

gen agri = 1 if occisco == 6 // skilled agri, fishery
replace agri = 0 if (occisco >= 1 & occisco <= 5) | (occisco >= 7 & occisco <= 10)
replace agri = 0 if employed == 0

gen elec = 1 if electric == 1 // access to electricity
replace elec = 0 if electric  == 2
gen water = 1 if watsup == 11 | watsup == 13
replace water = 0 if watsup == 20
gen cellph = 1 if cell == 1
replace cellph = 0 if cell == 2
gen telev = 1 if tv == 20
replace telev = 0 if tv == 10
gen car = 1 if autos == 7
replace car = 0 if autos == 0
gen fridge = 1 if refrig == 2
replace fridge = 0 if refrig == 1

gen chdied = chdead if chdead <= 6 // child survival
gen chmort = chdied/chborn  if (chborn > 0 & chborn <= 14 & chsurv <= 10)
replace chmort = round(chmort, 0.01)
gen lastdied = 1 if lastbmort == 2
replace lastdied = 0 if lastbmort == 1

gen mortlastb = 1 if lastbmort == 1 & fem == 1 // mortality last birth
replace mortlastb = 0 if lastbmort == 2 & fem == 1
gen chdead2 = chdead if chdead <= 4
gen chdeadprev = 1 if chdead2 > 0 & chdead2 < . & fem == 1
replace chdeadprev = 0 if chdead2 == 0 & fem == 1

gen moved10 = 1 if migrate0 == 10 | migrate0 == 14 | migrate0 == 20 | migrate0 == 30 // migration
replace moved10 = 0 if migrate0 == 11

gen migSA = 1 if migrate0 == 30 & migctry0 == 14040 // resided in South Afr - migration status for kids >9 years
replace migSA = 0 if migrate0 == 30 & migctry0 == 60000 // other country
replace migSA = 0 if migrate0 >= 10 & migrate0 <= 20 // non-migrants (international)

gen workSA = 1 if ls2006a_work10yr == 2 | ls2006a_work10yr == 3
replace workSA = 0 if ls2006a_work10yr == 0 | ls2006a_work10yr == 1 | ls2006a_work10yr == 8

gen yearSA = ls2006a_workdur if ls2006a_workdur <= 20 // with zero being never or less than a year in South Afr
replace yearSA = 0 if workSA == 0

save "$lesotho_census/census2006.dta", replace

* Census data for South Africa

use "$southafrica_census/census_south afr_all", clear // from IPUMS
replace birthmo = za2001a_bmo if year == 2001
replace birthmo = za2007a_birmon if year == 2007
gen birthmo_jul = birthmo >= 7 & birthmo <= 12
keep if birthmo <= 12
gen june = birthmo == 6
gen birthmo_cent = birthmo - 6.5
gen birthmo_cent2 = birthmo_cent^2
gen sesotho = 1 if langza1==7 // speaks Sesotho at home
replace sesotho = 0 if langza1 <7 | (langza1 > 7 & langza1 < 90) 
gen income = inctot if inctot < 3000000
gen bornLES = 0 if za2016a_bplcntry <. & year == 2016 // born in Lesotho
replace bornLES = 0 if bplcountry < . & (year == 2001 | year == 2011)
replace bornLES = 1 if za2016a_bplcntry == 426 & year == 2016
replace bornLES = 1 if bplcountry == 14020 & (year == 2001 | year == 2011)
save "$southafrica_census/sa_census.dta", replace

**************************************************************************************
* CLEAN FOLDER
**************************************************************************************

erase "$raw_data/temp.dta"

