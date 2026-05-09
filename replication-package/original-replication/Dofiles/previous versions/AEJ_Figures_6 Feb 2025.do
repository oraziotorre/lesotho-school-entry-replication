**************************************************************************************
**************************************************************************************
* This do-file contains replication coding for the following article:
* Age at School Entry and Human Capital Development: Evidence from Lesotho
* Authors: De Neve, Moshoeshoe, Bor (2025)
* Stata version 17.0 was used for all analyses.
* Description:	Analysis/Figures 
**************************************************************************************
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
	global basutoland			"$project_folder/raw_data/basutoland"
	global dofiles				"$project_folder/Dofiles"
	global output				"$project_folder/Output"
	global tables				"$project_folder/Output/Tables"
	global figures				"$project_folder/Output/Figures"
	global log_file				"$project_folder/Logfiles"
	
	*Open log
	local date: display %-td_YYNNDD date(c(current_date), "DMY")
	local date_yymmdd = subinstr("`date'", " ", "", .)
	global logfile "$log_file/`date_yymmdd'_AEJ_figures.log" // path and name of the log file
	log using "${logfile}", replace
	
	*Required user-written commands	
	*ssc install blindschemes, replace // for plotplain and ploting schemes in graphs
	*ssc install coefplot, replace // for plotting regression coefficients
	*ssc install rdrobust, replace // for rdplot, rddensity, etc
	*ssc install rddensity, replace
	*ssc install lpdensity, replace
	*ssc install statplot, replace
	*ssc install addplot, replace
	*ssc install schemepack, replace
	set scheme plotplain

**************************************************************************************
**************************************************************************************
* PART II. FIGURES
**************************************************************************************
**************************************************************************************

**# Bookmark

/*
(1) Entry into primary school
(2) Density in MOB
(3) Background characteristics 
(4) Educational attainment
(5) Literacy and ICT skills adults
(6) Economic outcomes
(7) Health outcomes
(8) Reading and math skills
(9) Time in nursery
(10) Outcomes for actual cohort (born 1995-1999)
(11) Intergenerational
(12) Basutoland report
*/

**************************************************************************************
* (1) ENTRY INTO PRIMARY SCHOOL
**************************************************************************************

**# Bookmark 

* Grade 1 enrolment by YOB and MOB using MICS data

use "$mics2018_data/mics6hl.dta", clear
collapse (mean) y=grade1ormore (semean) se_y=grade1ormore if birthyr >= 2011 & birthyr <= 2013, by(birthmoyr)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
gen rank = _n
twoway (scatter y rank, xlabel(1/36) xline(18.5) legend(off) xtitle("Month and year of birth") /// 
ytitle("Probability currently attending grade 1 or higher") /// 
xlabel(1 "Jan 2011" 2 "Feb 2011" 3 "Mar 2011" 4 "Apr 2011" 5 "May 2011" 6 "Jun 2011" 7 "Jul 2011" 8 "Aug 2011" 9 "Sep 2011" /// 
10 "Oct 2011" 11 "Nov 2011" 12 "Dec 2011" 13 "Jan 2012" 14 "Feb 2012" 15 "Mar 2012" 16 "Apr 2012" 17 "May 2012" 18 "Jun 2012" /// 
19 "Jul 2012" 20 "Aug 2012" 21 "Sep 2012" 22 "Oct 2012" 23 "Nov 2012" 24 "Dec 2012" 25 "Jan 2013" 26 "Feb 2013" 27 "Mar 2013" /// 
28 "Apr 2013" 29 "May 2013" 30 "Jun 2013" 31 "Jul 2013" 32 "Aug 2013" 33 "Sep 2013" 34 "Oct 2013" 35 "Nov 2013" 36 "Dec 2013", /// 
labsize(vsmall) angle(90)) title("(a) Entry into primary school")) (rcap yu yl rank)
graph save Graph "graph 1.dta", replace

* Age at entry

use "$mics2018_data/mics6hl.dta", clear
collapse (mean) y=schage (semean) se_y=schage if grade==1 & grade_r==0, by(birthmo)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
twoway (scatter y birthmo, xlabel(1/12) xline(6.5) ylabel(5(.25)6.25) legend(off) xtitle("Month of birth") ytitle("Age at beginning of school year (years)") ylabel(5 "5" 5.25 "5.25" 5.5 "5.5" 5.75 "5.75" 6 "6" 6.25 "6.25") xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec",labsize(vsmall)) title("(b) Average age at entry into grade 1")) (rcap yu yl birthmo) 

graph save Graph "graph 2.dta", replace
graph combine "graph 1.dta" "graph 2.dta", col(2) scale(1)
gr export "$figures/MOB_and_SchoolEntry.jpg", replace

* Average age amomg kids in Grade 6 using SACMEQ data

use "$sacmeq_data/sacmeqiii_ii.dta", clear
replace pbday = pbday-181 if birthmo==1
replace pbday = pbday-151 if birthmo==2
replace pbday = pbday-121 if birthmo==3
replace pbday = pbday-91 if birthmo==4
replace pbday = pbday-61 if birthmo==5
replace pbday = pbday-31 if birthmo==6
replace pbday = pbday+30 if birthmo==8
replace pbday = pbday+60 if birthmo==9
replace pbday = pbday+90 if birthmo==10
replace pbday = pbday+120 if birthmo==11
replace pbday = pbday+150 if birthmo==12
rename pbday dayofbirth
rename birthmo_jul birthmo_jul_dec
keep if ((yob >= 1987 & year == 2000) | (yob >= 1994 & year == 2007)) & everrepeated == 0
rdplot age dayofbirth, nbins(26 26) ci(95) graph_options(xtitle("Day of birth relative to June 30th cutoff") ytitle("Age (years)") legend(off) xlabel(-180(60)180))
gr export "$figures/AverageAge.jpg", replace

* Using Lesotho Census data

use "$lesotho_census/census2006.dta", clear
collapse (mean) y=everattprim (semean) se_y=everattprim if birthyr==2000, by(birthmo)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
twoway (scatter y birthmo, xlabel(1/12) legend(off) xtitle("Month of birth") ytitle("Probability ever attended primary school") title("(a) Not corrected for survey artefact") xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec",labsize(vsmall))) (rcap yu yl birthmo) 
graph save Graph "graph 1.dta", replace

use "$lesotho_census/census2006.dta", clear
replace everattprim = 1 if educls==12 & (birthmo ==5 | birthmo==6) // recode pre-school taking into account bottom-coding
collapse (mean) y=everattprim (semean) se_y=everattprim if birthyr==2000, by(birthmo)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
twoway (scatter y birthmo, xlabel(1/12) legend(off) xtitle("Month of birth") ytitle("Probability ever attended primary school") title("(b) Corrected for survey artefact") xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec",labsize(vsmall))) (rcap yu yl birthmo) 
graph save Graph "graph 2.dta", replace

graph combine "graph 1.dta" "graph 2.dta", col(2)
gr export "$figures/MOB_and_SchoolEntry_census.jpg", replace

**************************************************************************************
* (2) DENSITY IN MOB
**************************************************************************************

**# Bookmark

* Density in DOB by survey

use "$mics2018_data/mics6hl.dta", clear
keep if birthmo <. 
hist birthmo if age <= 15, disc freq xlabel(1/13) legend(off) title("(a) MICS 2018: Month of birth") xtitle("Month of birth") ytitle("Frequency") xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec" 13 " ",labsize(vsmall)) 
graph save Graph "graph 1.dta", replace

use "$mics2018_data/bh.dta", clear // birth history
keep BH4D BH4M BH4Y BH5 BH6 BH7 BH8 welevel
gen birthday_child = BH4D if BH4D <= 31
gen birthmo_child = BH4M if BH4M <= 12
gen age_child = BH6 if BH6 <= 37
* hist birthmo_child, disc freq
gen mom_sec = 1 if welevel == 2 | welevel == 3
replace mom_sec = 0 if welevel == 1
keep if (birthmo_child >= 5 & birthmo_child <= 8) & age_child > 4
drop if birthday_child == .
drop if birthday_child == 31
replace birthday_child = birthday_child - 30.5 if birthmo_child==6
replace birthday_child = birthday_child - 60.5 if birthmo_child==5
replace birthday_child = birthday_child - .5 if birthmo_child==7
replace birthday_child = birthday_child + 29.5 if birthmo_child==8
rddensity birthday_child, c(0) plot hist_width(1) graph_opt(xtitle("Day of birth relative to June 30th cutoff") ytitle("Frequency") legend(off) xlabel(-60(10)60) title("(b) MICS 2018: Exact date of birth"))
graph save Graph "graph 2.dta", replace

use "$lesotho_census/census lesotho.dta", clear 
keep if year == 2006
keep if birthmo <. 
hist birthmo if age <= 15, disc freq xlabel(1/13) legend(off) title("(c) Census 2006: Month of birth") xtitle("Month of birth") ytitle("Frequency") xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec" 13 " ",labsize(vsmall)) 
graph save Graph "graph 3.dta", replace

use "$dhs_data/dhspooledPR.dta", replace
keep if birthmo <. 
hist birthmo if age >= 15 & age <= 35, disc freq xlabel(1/13) legend(off) title("(d) DHS 2004-05, 2009-10, 2014: Month of birth")xtitle("Month of birth") ytitle("Frequency") xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec" 13 " ",labsize(vsmall)) 
graph save Graph "graph 4.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta" "graph 4.dta", col(2) xsize(6)
gr export "$figures/Density_tests.jpg", replace

**************************************************************************************
* (3) BACKGROUND CHARACTERISTICS
**************************************************************************************

**# Bookmark

* Maternal education of first born child

use "$mics2018_data/micsbh.dta", clear
keep if brthord == 1 // first born child
drop if birthmo_child == .
collapse (mean) y=momsec (semean) se_y=momsec, by(birthmo_child)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
twoway (scatter y birthmo_child, xlabel(1(1)12) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" /// 
9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec") ytitle("Probability mother attained secondary school") xtitle("Month of birth of first child") ylabel(.4(.1).7) xline(6.5) legend(off)) (rcap yu yl birthmo_child) 
gr export "$figures/placebo_maternaleducation.jpg", replace

* Placebo test: adult height

use "$dhs_data/dhswomen.dta", clear
collapse (mean) y=height (semean) se_y=height, by(birthmo)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
twoway (scatter y birthmo, xlabel(1(1)12) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" /// 
9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec") xtitle("Month of birth") ylabel(155(1)159) ytitle("Measured adult height in centimeters") xline(6.5) legend(off)) (rcap yu yl birthmo) 
gr export "$figures/placebo_adultheight.jpg", replace 

* Background characteristics children

use "$dhs_data/dhskids.dta", clear
keep if b1 == 6 | b1 == 7
keep if age >=3 & age <= 4
save "$dhs_data/temp.dta", replace

use "$dhs_data/temp.dta", clear
collapse (mean) y=bord (semean) se_y=bord, by(b1)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
twoway (scatter y b1, xlabel(6(1)7) xlabel(5 " " 6 "June-born" 7 "July-born" 8 " ", noticks) title("(a) Birth order") xtitle("Month of birth") ytitle("Birth order") legend(off) ylabel(2(0.5)3.5)) (rcap yu yl b1) 
graph save Graph "graph 1.dta", replace

use "$dhs_data/temp.dta", clear
collapse (mean) y=birthweight  (semean) se_y=birthweight, by(b1)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
twoway (scatter y b1, xlabel(6(1)7) xlabel(5 " " 6 "June-born" 7 "July-born" 8 " ", noticks) title("(b) Birthweight") xtitle("Month of birth") ytitle("Birthweight (grams)") legend(off) ylabel(2900(100)3300)) (rcap yu yl b1) 
graph save Graph "graph 2.dta", replace

use "$dhs_data/temp.dta", clear
collapse (mean) y=stunt (semean) se_y=stunt, by(b1)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
twoway (scatter y b1, xlabel(6(1)7) xlabel(5 " " 6 "June-born" 7 "July-born" 8 " ", noticks) title("(c) Stunting") xtitle("Month of birth") ytitle("Probability stunted") legend(off) ylabel(.2(.1).7)) (rcap yu yl b1) 
graph save Graph "graph 3.dta", replace

use "$dhs_data/temp.dta", clear
collapse (mean) y=underwght (semean) se_y=underwght, by(b1)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
twoway (scatter y b1, xlabel(6(1)7) xlabel(5 " " 6 "June-born" 7 "July-born" 8 " ", noticks) title("(d) Underweight") xtitle("Month of birth") ytitle("Probability underweight") legend(off) ylabel(0(.05).3)) (rcap yu yl b1) 
graph save Graph "graph 4.dta", replace

use "$dhs_data/temp.dta", clear
collapse (mean) y=anemia (semean) se_y=anemia, by(b1)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
twoway (scatter y b1, xlabel(6(1)7) xlabel(5 " " 6 "June-born" 7 "July-born" 8 " ", noticks) title("(e) Anemia") xtitle("Month of birth") ytitle("Probability any anemia") legend(off) ylabel(0.2(.1).6)) (rcap yu yl b1) 
graph save Graph "graph 5.dta", replace

use "$dhs_data/temp.dta", clear
collapse (mean) y=cough (semean) se_y=cough, by(b1)
gen yu = y + 1.96*se_y
gen yl = y - 1.96*se_y
twoway (scatter y b1, xlabel(6(1)7) xlabel(5 " " 6 "June-born" 7 "July-born" 8 " ", noticks) title("(f) Cough") xtitle("Month of birth") ytitle("Cough in past 2 weeks") legend(off) ylabel(0.1(.05).35)) (rcap yu yl b1) 
graph save Graph "graph 6.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta" "graph 4.dta" "graph 5.dta" "graph 6.dta", col(2) ysize(4) xsize(3) scale(1)
gr export "$figures/placebo_childcharateristics.jpg", replace 

**************************************************************************************
* (4) EDUCATIONAL ATTAINMENT 
**************************************************************************************

**# Bookmark

* Total schooling completed

use "$mics2018_data/mics6hl.dta", clear
keep if age >= 18 & age <= 35 
rdplot eduyrs birthmo, c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Total years of schooling completed") xlabel(1/12, labsize(small)) legend(off))) 
addplot: , text(7.7 9.5 "RD: 0.405 (s.e.: 0.142) ", size(msmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
gr export "$figures/Years_of_education.jpg", replace 

* Total schooling completed by gender

use "$mics2018_data/mics6hl.dta", clear 
keep if age >= 18 & age <= 59
rdplot eduyrs birthmo if fem == 1, c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Total years of schooling") title((a) Female (MICS 2018)) xlabel(1/12, labsize(small)) legend(off))) 
addplot: , text(7.75 9.5 "RD: 0.427 (s.e.: 0.141) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 1.dta", replace

use "$mics2018_data/mics6hl.dta", clear
keep if age >= 18 & age <= 59 
rdplot eduyrs birthmo if fem == 0, c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Total years of schooling")title((b) Male (MICS 2018)) xlabel(1/12, labsize(small)) legend(off))) 
addplot: , text(5.8 9.5 "RD: 0.369 (s.e.: 0.185) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 2.dta", replace

use "$dhs_data/dhspooled.dta", clear
keep if age >= 18 & age <= 59
rdplot eduyrs birthmo if fem == 1, c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Total years of schooling")title((c) Female (DHS 2004-14)) xlabel(1/12, labsize(small)) legend(off))) 
addplot: , text(7.15 9.5 "RD: 0.348 (s.e.: 0.087) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 3.dta", replace

use "$dhs_data/dhspooled.dta", clear
keep if age >= 18 & age <= 59 
rdplot eduyrs birthmo if fem == 0, c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Total years of schooling")title((d) Male (DHS 2004-14)) xlabel(1/12, labsize(small)) legend(off))) 
addplot: , text(5.1 9.5 "RD: 0.547 (s.e.: 0.191) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 4.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta" "graph 4.dta", col(2) scale(1)
gr export "$figures/years_of_education_by_gender_rddplot.jpg", replace 

* Reversal in highest schooling year attended (not necessarily completed) - Combined (Figure 5)

use "$mics2018_data/mics6hl.dta", clear
foreach x of num 3/19 {													
reg educ birthmo_jul if schage == `x', r
est sto m`x' 
}
coefplot (m3, aseq(3) \ m4, aseq(4) \ m5, aseq(5) \ m6, aseq(6) \ m7, aseq(7) \ m8, aseq(8) \ m9, aseq(9) \ m10, aseq(10) \ m11, aseq(11) \ m12, aseq(12) \ m13, aseq(13) \ m14, aseq(14) \ m15, aseq(15) \ m16, aseq(16) \ m17, aseq(17) \ m18, aseq(18) \ m19, aseq(19)), keep (birthmo_jul) vertical swapnames connect (1 2 3 4 5 6 7 8 9 10 11 12) lwidth(*2) ciopts(recast(rline) lpattern(dash)) xtitle("Age at beginning of school year (years)") title ("") ylabel(-1(.5)1.5) ytitle("Coefficient on treatment variable")
gr export "$figures/Reversal_of_fortunes.jpg", replace 

* Reversal in highest schooling year attended (not necessarily completed) by gender

use "$mics2018_data/mics6hl.dta", clear
foreach x of num 3/19 {													
reg educ birthmo_jul if schage == `x' & fem == 1, r
est sto m`x' 
}
coefplot (m3, aseq(3) \ m4, aseq(4) \ m5, aseq(5) \ m6, aseq(6) \ m7, aseq(7) \ m8, aseq(8) \ m9, aseq(9) \ m10, aseq(10) \ m11, aseq(11) \ m12, aseq(12) \ m13, aseq(13) \ m14, aseq(14) \ m15, aseq(15) \ m16, aseq(16) \ m17, aseq(17) \ m18, aseq(18) \ m19, aseq(19)), keep (birthmo_jul) vertical swapnames connect (1 2 3 4 5 6 7 8 9 10 11 12) lwidth(*2) ciopts(recast(rline) lpattern(dash)) xtitle("Age at beginning of school year (years)") title ("(a) Female") ylabel(-1(.5)1.5) ytitle("Coefficient on treatment variable")
graph save Graph "graph 1.dta", replace

use "$mics2018_data/mics6hl.dta", clear
foreach x of num 3/19 {													
reg educ birthmo_jul if schage == `x' & fem == 0, r
est sto m`x' 
}
coefplot (m3, aseq(3) \ m4, aseq(4) \ m5, aseq(5) \ m6, aseq(6) \ m7, aseq(7) \ m8, aseq(8) \ m9, aseq(9) \ m10, aseq(10) \ m11, aseq(11) \ m12, aseq(12) \ m13, aseq(13) \ m14, aseq(14) \ m15, aseq(15) \ m16, aseq(16) \ m17, aseq(17) \ m18, aseq(18) \ m19, aseq(19)), keep (birthmo_jul) vertical swapnames connect (1 2 3 4 5 6 7 8 9 10 11 12) lwidth(*2) ciopts(recast(rline) lpattern(dash)) xtitle("Age at beginning of school year (years)") title ("(b) Male") ylabel(-1(.5)1.5) ytitle("Coefficient on treatment variable")
graph save Graph "graph 2.dta", replace

graph combine "graph 1.dta" "graph 2.dta", col(2)
gr export "$figures/Reversal_of_fortunes_gender.jpg", replace 

* Grade X or higher and exact DOB

use "$mics2018_data/mics_day.dta", clear
keep if birthmo >= 2 & birthmo <= 11
drop if birthday == 31
drop if schage == . 
drop if grade1ormore == . // only available until age 24
replace birthday = birthday - 150.5 if birthmo==2
replace birthday = birthday - 120.5 if birthmo==3
replace birthday = birthday - 90.5 if birthmo==4
replace birthday = birthday - 60.5 if birthmo==5
replace birthday = birthday - 30.5 if birthmo==6
replace birthday = birthday - .5 if birthmo==7
replace birthday = birthday + 29.5 if birthmo==8
replace birthday = birthday + 59.5 if birthmo==9
replace birthday = birthday + 89.5 if birthmo==10
replace birthday = birthday + 119.5 if birthmo==11

rdplot grade1ormore birthday if schage==5, c(0) nbins(24 24) p(2) graph_options(xtitle("Day of birth relative to cutoff") ytitle("Pr (attend Grade 1 or more)") ylabel(0(.2)1) xlabel(-150(20)150) legend(off) title((a) Grade 1 or higher (7-day bins)))))
graph save Graph "graph 1.dta", replace
rdplot grade1ormore birthmo if schage==5, c(6.5) nbins(5 5) p(2) graph_options(xtitle("Month of birth relative to cutoff") ytitle("Pr (attend Grade 1 or more)") ylabel(0(.2)1) xlabel(2(1)11) legend(off) title((b) Grade 1 or higher (monthly bins)))))
addplot: , xlabel(2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov")
graph save Graph "graph 2.dta", replace

rdplot grade8ormore birthday if schage==15, c(0) nbins(24 24) p(2) graph_options(xtitle("Day of birth relative to cutoff") ytitle("Pr (attend Grade 8 or more)") ylabel(0(.2)1) xlabel(-150(20)150) legend(off) title((c) Grade 8 or higher (7-day bins)))))
graph save Graph "graph 3.dta", replace
rdplot grade8ormore birthmo if schage==15, c(6.5) nbins(5 5) p(2) graph_options(xtitle("Month of birth relative to cutoff") ytitle("Pr (attend Grade 8 or more)") ylabel(0(.2)1) xlabel(2(1)11) legend(off) title((d) Grade 8 or higher (monthly bins)))))
addplot: , xlabel(2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov")
graph save Graph "graph 4.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta" "graph 4.dta", col(2) scale(1)
gr export "$figures/Probability_of_attending_gradeX_or_higher.jpg", replace 

* Out of school by grade and age

use "$mics2018_data/mics6hl.dta", clear
gen out = 1 if current == 0
replace out = 0 if current == 1
keep if grade_lst >=1 & grade_lst <= 11
keep if schage >= 6 & schage <= 19
graph bar (mean) out, over(birthmo_jul) over(grade_lst) ascategory asyvars bar(1, color(black)) bar(2, color(gray)) ytitle("Probability dropping out current school year") b1title("Grade of education attended previous school year") title("(a) Early school leaving by grade") legend(pos(6) col(2) lab(1 "Born January - June") lab(2 "Born July - December")) 
graph save Graph "graph 1.dta", replace

use "$mics2018_data/mics6hl.dta", clear
foreach x of num 7/19 {													
reg both birthmo_jul if schage == `x', r
est sto m`x' 
}
coefplot (m7, aseq(7) \ m8, aseq(8) \ m9, aseq(9) \ m10, aseq(10) \ m11, aseq(11) \ m12, aseq(12) \ m13, aseq(13) \ m14, aseq(14) \ m15, aseq(15) \ m16, aseq(16) \ m17, aseq(17) \ m18, aseq(18) \ m19, aseq(19)), keep (birthmo_jul) vertical swapnames connect (1 2 3 4 5 6 7 8 9 10 11 12) lwidth(*2) ciopts(recast(rline) lpattern(dash)) xtitle("Age at beginning of school year (years)") ytitle("Coefficient on treatment variable") title ("(b) Early school leaving and grade repetition by age")
graph save Graph "graph 2.dta", replace

graph combine "graph 1.dta" "graph 2.dta", col(2) scale(1)
gr export "$figures/School_leaving_by_age_grade.jpg", replace 

* Completed at least X years of schooling

use "$dhs_data/dhspooled.dta", clear // using DHS
append using "$mics2018_data/mics6hl.dta"
keep if age >= 25 & age <= 49
keep if birthmo == 6 | birthmo == 7
statplot AtLeast1 AtLeast2 AtLeast3 AtLeast4 AtLeast5 AtLeast6 AtLeast7 AtLeast8 AtLeast9 AtLeast10 AtLeast11 AtLeast12 AtLeast13 AtLeast14, over(birthmo_jul) ytitle(Pr (Completed at least X years of schooling)) title ("(a) Pr (Atleast X years) by month of birth") legend(lab(1 "Born June") lab(2 "Born July") size(small) ring(0) pos(2)) asyvars bar(1, color(black)) bar(2, color(gray)) recast(bar) varopts(label(angle(45)))
graph save Graph "graph 1.dta", replace

use "$mics2018_data/mics6hl.dta", clear
gen year=2018
append using "$dhs_data/dhspooled.dta"
keep if age >= 25 & age <= 49

reg AtLeast1 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m1
margins if birthmo_jul == 0
reg AtLeast2 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m2
margins if birthmo_jul == 0
reg AtLeast3 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m3
margins if birthmo_jul == 0
reg AtLeast4 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m4
margins if birthmo_jul == 0
reg AtLeast5 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m5
margins if birthmo_jul == 0
reg AtLeast6 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m6
margins if birthmo_jul == 0
reg AtLeast7 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m7
margins if birthmo_jul == 0
reg AtLeast8 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m8
margins if birthmo_jul == 0
reg AtLeast9 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m9
margins if birthmo_jul == 0
reg AtLeast10 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m10
margins if birthmo_jul == 0
reg AtLeast11 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m11
margins if birthmo_jul == 0
reg AtLeast12 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m12
margins if birthmo_jul == 0
reg AtLeast13 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m13
margins if birthmo_jul == 0
reg AtLeast14 birthmo_jul c.birthmo_cent i.birthmo_jul#c.birthmo_cent i.age fem i.year, r
est sto m14
margins if birthmo_jul == 0

coefplot (m1, aseq(1) \ m2, aseq(2) \ m3, aseq(3) \ m4, aseq(4) \ m5, aseq(5) \ m6, aseq(6) \ m7, aseq(7) \ m8, aseq(8) \ m9, aseq(9) \ m10, aseq(10) \ m11, aseq(11) \ m12, aseq(12) \ m13, aseq(13) \ m14, aseq(14)), keep (birthmo_jul) vertical swapnames connect (1 2 3 4 5 6 7 8 9 10 11 12 13) lwidth(*2) ciopts(recast(rline) lpattern(dash)) xtitle("Completed at least X years of schooling (=1)") title ("(b) Regression discontinuity estimates") ytitle("Coefficient on treatment variable")
graph save Graph "graph 2.dta", replace

graph combine "graph 1.dta" "graph 2.dta", col(2)
gr export "$figures/School_attainment.jpg", replace 

**************************************************************************************
* (5) LITERACY AND ICT SKILLS AMONG ADULTS
**************************************************************************************

**# Bookmark

use "$mics2018_data/mics2018_wm_mn.dta", clear // using MICS
keep if age >= 18 & age <= 49

rdplot lit birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Probability literate") xlabel(1/12) legend(off) title((a) Literacy (MICS 2018))))
addplot: , text(.86 9.5 "RD: 0.032 (s.e.: 0.012) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 1.dta", replace

use "$dhs_data/dhspooled.dta", clear // using DHS
keep if age >= 18 & age <= 49
rdplot lit birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Probability literate") xlabel(1/12) legend(off) title((b) Literacy (DHS 2004-14))))
addplot: , text(.86 9.5 "RD: 0.017 (s.e.: 0.007) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 2.dta", replace

use "$dhs_data/dhspooled.dta", clear // using DHS
keep if age >= 18 & age <= 49
rdplot read birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Probability reading") xlabel(1/12) legend(off) title((c) Reading news or magazine)))
addplot: , text(.26 9.5 "RD: 0.039 (s.e.: 0.012) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 3.dta", replace

use "$mics2018_data/mics2018_wm_mn.dta", clear 
keep if age >= 18 & age <= 49 
rdplot ict birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Probability performs activities") xlabel(1/12) legend(off) title((d) Any computer activities)))
addplot: , text(.06 9.5 "RD: 0.023 (s.e.: 0.014) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 4.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta" "graph 4.dta", col(2) scale(1)
gr export "$figures/literacy_ICT_skills_adults.jpg", replace 

**************************************************************************************
* (6) ECONOMIC OUTCOMES
**************************************************************************************

**# Bookmark

* Compound figure for labor 

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 18 & age <= 59
rdplot worked12 birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Pr (worked past 12 months)") xlabel(1/12) legend(off) title((a) Worked past 12 months)))
addplot: , text(.505 9.5 "RD: 0.013 (s.e.: 0.012) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 1.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 18 & age <= 59
rdplot agri birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Pr (worked in agriculture)") xlabel(1/12) legend(off) title((b) Worked in agriculture)))
addplot: , text(.285 9.5 "RD: -0.011 (s.e.: 0.011) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 2.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 18 & age <= 59
rdplot highskill birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Pr (high skill occupation)") xlabel(1/12) legend(off) title((c) "High class" occupation)))
addplot: , text(.105 9.5 "RD: 0.018 (s.e.: 0.009) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 3.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 18 & age <= 59
rdplot wi birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Household wealth index") xlabel(1/2) legend(off) title((d) Household wealth)))
addplot: , text(2.925 9.5 "RD: 0.129 (s.e.: 0.036) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 4.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta" "graph 4.dta", col(2) scale(1)
gr export "$figures/economic_outcomes.jpg", replace 

* Compound figure for labor by gender

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 25 & age <= 59
rdplot worked12 birthmo if fem == 1, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(worked past 12 months)", size(vsmall)) xlabel(1/12) legend(off) title((a) Worked past 12 months (female))))
addplot: , text(.51 9.5 "RD: 0.014 (s.e.: 0.015)", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 1.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 25 & age <= 59
rdplot worked12 birthmo if fem == 0, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(worked past 12 months)", size(vsmall)) xlabel(1/12) legend(off) title((b) Worked past 12 months (male))))
addplot: , text(.665 9.5 "RD: 0.016 (s.e.: 0.021)", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 2.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 25 & age <= 59 
rdplot agri birthmo if fem == 1, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(worked in agriculture)", size(vsmall)) xlabel(1/12) legend(off) title((c) Employed in agriculture (female))))
addplot: , text(.24 9.5 "RD: 0.014 (s.e.: 0.013)", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 3.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 25 & age <= 59 
rdplot agri birthmo if fem == 0, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(worked in agriculture)", size(vsmall)) xlabel(1/12) legend(off) title((d) Employed in agriculture (male))))
addplot: , text(.465 9.5 "RD: -0.002 (s.e.: 0.023)", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 4.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 25 & age <= 59 
rdplot highskill birthmo if fem == 1, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(high class occupation)", size(vsmall)) xlabel(1/12) legend(off) title((e) High class occupation (female))))
addplot: , text(.15 9.5 "RD: 0.020 (s.e.: 0.011)", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 5.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 25 & age <= 59 
rdplot highskill birthmo if fem == 0, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(high class occupation)", size(vsmall)) xlabel(1/12) legend(off) title((f) High class occupation (male))))
addplot: , text(.06 9.5 "RD: 0.015 (s.e.: 0.014)", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 6.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 25 & age <= 59 
rdplot wi birthmo if fem == 1, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Wealth index quintile", size(vsmall)) xlabel(1/12) legend(off) title((g) Household wealth (female))))
addplot: , text(2.85 9.5 "RD: 0.162 (s.e.: 0.044)", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 7.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 25 & age <= 59 
rdplot wi birthmo if fem == 0, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Wealth index quintile", size(vsmall)) xlabel(1/12) legend(off) title((h) Household wealth (male))))
addplot: , text(2.65 9.5 "RD: 0.083 (s.e.: 0.067)", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 8.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta" "graph 4.dta" "graph 5.dta" "graph 6.dta" "graph 7.dta" "graph 8.dta", col(2) ysize(4) xsize(3) scale(1) 
gr export "$figures/economic_outcomes_gender.jpg", replace 

**************************************************************************************
* (7) HEALTH OUTCOMES
**************************************************************************************

**# Bookmark

* Compound figure for sexual and reproductive health

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 20 & age <= 49 & fem == 1
rdplot kids birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Number of children") xlabel(1/12) legend(off) title((a) Childbearing)))
addplot: , text(2.05 9.5 "RD: -0.209 (s.e.: 0.049) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 1.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 20 & age <= 49 & fem == 1
rdplot agefirstkid20 birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Pr (age at first child < 20 years)") xlabel(1/12) legend(off) title((b) Age at first child < 20 years)))
addplot: , text(.355 9.5 "RD: -0.045 (s.e.: 0.016) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 2.dta", replace

use "$dhs_data/dhspooled.dta", clear // DHS pooled sample of women and men
keep if age >= 20 & age <= 49
rdplot evermarried birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Pr (ever married)") xlabel(1/12) legend(off) title((c) Marriage)))
addplot: , text(.701 9.5 "RD: -0.029 (s.e.: 0.011) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 3.dta", replace

use "$dhs_data/dhshiv.dta", clear
keep if age >= 20 & age <= 49
rdplot hivpos birthmo, nbins(1000 1000) c(6.5) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Pr (HIV test positive)") xlabel(1/12) legend(off) title((d) HIV infection)))
addplot: , text(.255 9.5 "RD: -0.001 s.e.: 0.014) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 4.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta" "graph 4.dta", col(2) scale(1)
gr export "$figures/health_outcomes.jpg", replace 

* Compound figure for sexual and reproductive health by gender

use "$dhs_data/dhspooled.dta", clear 
keep if age >= 18 & age < = 59
rdplot kids birthmo if fem == 1, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Number of children", size(vsmall)) xlabel(1(1)12, labsize(small) valuelabel) legend(off) title((a) Number of children (female))))
addplot: , text(1.8 9.5 "RD: -0.190 (s.e.: 0.044) ", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 1.dta", replace

use "$dhs_data/dhspooled.dta", clear 
keep if age >= 18 & age < = 59
rdplot kids birthmo if fem == 0, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Number of children", size(vsmall)) xlabel(1(1)12, labsize(small) valuelabel) legend(off) title((b) Number of children (male)))) 
addplot: , text(1.05 9.5 "RD: -0.073 (s.e.: 0.072) ", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 2.dta", replace

use "$dhs_data/dhspooled.dta", clear 
keep if age >= 20 & age < = 59
rdplot agefirstkid20 birthmo if fem == 1, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(age at first child < 20 years)", size(vsmall)) xlabel(1(1)12, labsize(small) valuelabel) legend(off) title((c) Age at first child <20 (female)))) 
addplot: , text(.355 9.5 "RD: -0.045 (s.e.: 0.016) ", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 3.dta", replace

use "$dhs_data/dhspooled.dta", clear 
keep if age >= 20 & age < = 59
rdplot agefirstkid20 birthmo if fem == 0, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(age at first child < 20 years)", size(vsmall)) xlabel(1(1)12, labsize(small) valuelabel) legend(off) title((d) Age at first child <20 (male)))) 
addplot: , text(.005 9.5 "RD: -0.015 (s.e.: 0.009) ", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 4.dta", replace

use "$dhs_data/dhspooled.dta", clear 
keep if age >= 18 & age < = 59
rdplot evermarried birthmo if fem == 1, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(ever married)", size(vsmall)) xlabel(1/12, labsize(small) valuelabel) legend(off) title((e) Ever married (female)))) 
addplot: , text(.705 9.5 "RD: -0.031 (s.e.: 0.011) ", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 5.dta", replace

use "$dhs_data/dhspooled.dta", clear 
keep if age >= 18 & age < = 59
rdplot evermarried birthmo if fem == 0, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(ever married)", size(vsmall)) xlabel(1(1)12, labsize(small) valuelabel) legend(off) title((f) Ever married (male)))) 
addplot: , text(.46 9.5 "RD: -0.026 (s.e.: 0.017) ", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 6.dta", replace

use "$dhs_data/dhshiv.dta", clear
keep if age >= 18 & age < = 59
rdplot hivpos birthmo if fem == 1, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(HIV positive)", size(vsmall)) xlabel(1(1)12, labsize(small) valuelabel) legend(off) title((g) HIV infection (female)))) 
addplot: , text(.255 9.5 "RD: 0.021 (s.e.: 0.021) ", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 7.dta", replace

use "$dhs_data/dhshiv.dta", clear
keep if age >= 18 & age < = 59
rdplot hivpos birthmo if fem == 0, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth", size(vsmall)) ytitle("Pr(HIV positive)", size(vsmall)) xlabel(1(1)12, labsize(small) valuelabel) legend(off) title((h) HIV infection (male)))) 
addplot: , text(.15 9.5 "RD: -0.041 (s.e.: 0.020) ", size(vsmall)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec", labsize(vsmall))
graph save Graph "graph 8.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta" "graph 4.dta" "graph 5.dta" "graph 6.dta" "graph 7.dta" "graph 8.dta", col(2) ysize(4) xsize(3) scale(1)
gr export "$figures/health_outcomes_gender.jpg", replace 

* Results for family formation separately by age

use "$dhs_data/dhspooled.dta", clear 
foreach x of num 15/49 {													
reg kids birthmo_jul if age == `x' & fem == 1, r
est sto m`x' 
}
coefplot (m15, aseq(15) \ m16, aseq(16) \ m17, aseq(17) \ m18, aseq(18) \ m19, aseq(19) \ m20, aseq(20) \ m21, aseq(21) \ m22, aseq(22) \ m23, aseq(23) \ m24, aseq(24) \ m25, aseq(25) \ m26, aseq(26) \ m27, aseq(27) \ m28, aseq(28) \ m29, aseq(29) \ m30, aseq(30) \ m31, aseq(31) \ m32, aseq(32) \ m33, aseq(33) \ m34, aseq(34) \ m35, aseq(35) \ m36, aseq(36) \ m37, aseq(37) \ m38, aseq(38) \ m39, aseq(39) \ m40, aseq(40) \ m41, aseq(41) \ m42, aseq(42) \ m43, aseq(43) \ m44, aseq(44) \ m45, aseq(45)), keep (birthmo_jul) vertical swapnames connect (1 2 3 4 5 6 7 8 9 10 11 12) lwidth(*2) ciopts(recast(rline) lpattern(dash)) xtitle("Age at beginning of school year (years)") ytitle("Coefficient on treatment variable") title("(a) Number of children by age")
graph save Graph "graph 1.dta", replace

foreach x of num 15/49 {													
reg evermarried birthmo_jul if age == `x' & fem == 1, r
est sto m`x' 
}
coefplot (m15, aseq(15) \ m16, aseq(16) \ m17, aseq(17) \ m18, aseq(18) \ m19, aseq(19) \ m20, aseq(20) \ m21, aseq(21) \ m22, aseq(22) \ m23, aseq(23) \ m24, aseq(24) \ m25, aseq(25) \ m26, aseq(26) \ m27, aseq(27) \ m28, aseq(28) \ m29, aseq(29) \ m30, aseq(30) \ m31, aseq(31) \ m32, aseq(32) \ m33, aseq(33) \ m34, aseq(34) \ m35, aseq(35) \ m36, aseq(36) \ m37, aseq(37) \ m38, aseq(38) \ m39, aseq(39) \ m40, aseq(40) \ m41, aseq(41) \ m42, aseq(42) \ m43, aseq(43) \ m44, aseq(44) \ m45, aseq(45)), keep (birthmo_jul) vertical swapnames connect (1 2 3 4 5 6 7 8 9 10 11 12) lwidth(*2) ciopts(recast(rline) lpattern(dash)) xtitle("Age at beginning of school year (years)") ytitle("Coefficient on treatment variable") title("(b) Ever married by age") ylabel(-.2(.1).1) 
graph save Graph "graph 2.dta", replace

graph combine "graph 1.dta" "graph 2.dta", col(1) scale(1) ysize(6) xsize(5)
gr export "$figures/family_formation_age.jpg", replace 

**************************************************************************************
* (8) READING AND MATH SKILLS 
**************************************************************************************

**# Bookmark

* Skills

use "$mics2018_data/mics6fs.dta", clear
keep if schage >= 7 & schage <= 14

graph bar readsk_s [pw=fsweight], over(birthmo_jul) over(schagecat2_from5) ascategory asyvars bar(1, color(black)) bar(2, color(gray)) /// 
b1title("Age at beginning of school year", size(small)) ytitle("Pr(foundational reading skills Sesotho)", size(small)) title("(a) Sesotho reading skills") ///
legend(lab(1 "Born Jan - Jun") lab(2 "Born Jul - Dec") size(small)) 
graph save Graph "graph 1.dta", replace

graph bar readsk_e [pw=fsweight], over(birthmo_jul) over(schagecat2_from5) ascategory asyvars bar(1, color(black)) bar(2, color(gray)) /// 
b1title("Age at beginning of school year", size(small)) ytitle("Pr(foundational reading skills English)", size(small)) title("(b) English reading skills")  ///
legend(lab(1 "Born Jan - Jun") lab(2 "Born Jul - Dec") size(small)) 
graph save Graph "graph 2.dta", replace

graph bar numbskill [pw=fsweight], over(birthmo_jul) over(schagecat2_from5) ascategory asyvars bar(1, color(black)) bar(2, color(gray)) /// 
b1title("Age at beginning of school year", size(small)) ytitle("Pr(foundational numeracy skills)", size(small)) title("(c) Numeracy skills")  ///
legend(lab(1 "Born Jan - Jun") lab(2 "Born Jul - Dec") size(small)) 
graph save Graph "graph 3.dta", replace

use "$mics2018_data/mics6fs.dta", clear
keep if schage >= 7 & schage <= 14
graph bar read [pw=fsweight], over(birthmo_jul) over(schagecat2_from5) ascategory asyvars bar(1, color(black)) bar(2, color(gray)) /// 
b1title("Age at beginning of school year", size(small)) ytitle("Pr(child reads books at home)", size(small)) title("(d) Reading books at home") ///
legend(lab(1 "Born Jan - Jun") lab(2 "Born Jul - Dec") size(small)) 
graph save Graph "graph 4.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta" "graph 4.dta", col(2)
gr export "$figures/skills_kids.jpg", replace 

* Reading score by DOB and grade repetition

use "$sacmeq_data/sacmeqiii_ii.dta", clear

replace pbday = pbday-181 if birthmo==1
replace pbday = pbday-151 if birthmo==2
replace pbday = pbday-121 if birthmo==3
replace pbday = pbday-91 if birthmo==4
replace pbday = pbday-61 if birthmo==5
replace pbday = pbday-31 if birthmo==6
replace pbday = pbday+30 if birthmo==8
replace pbday = pbday+60 if birthmo==9
replace pbday = pbday+90 if birthmo==10
replace pbday = pbday+120 if birthmo==11
replace pbday = pbday+150 if birthmo==12

collapse (mean) standard_reading_score if ((yob == 1987 & birthmo >=7 & birthmo < . & year == 2000) | (yob == 1988 & birthmo <=6 & year == 2000) | (yob == 1994 & birthmo >=7 & birthmo < . & year == 2007) | (yob == 1995 & birthmo <=6 & year == 2007)) & everrepeated == 0, by(pbday birthmo_jul)
twoway lfitci standard_reading_score pbday if birthmo_jul == 1 || lfitci standard_reading_score pbday if birthmo_jul == 0 || /// 
sc standard_reading_score pbday if birthmo_jul == 1 || sc standard_reading_score pbday if birthmo_jul == 0, xtitle("Day of birth relative to June 30th cut-off") ytitle("Standardized reading score") xline(0) title("(a) Never repeated a grade") legend(off)
graph save Graph "graph 1.dta", replace

use "$sacmeq_data/sacmeqiii_ii.dta", clear

replace pbday = pbday-181 if birthmo==1
replace pbday = pbday-151 if birthmo==2
replace pbday = pbday-121 if birthmo==3
replace pbday = pbday-91 if birthmo==4
replace pbday = pbday-61 if birthmo==5
replace pbday = pbday-31 if birthmo==6
replace pbday = pbday+30 if birthmo==8
replace pbday = pbday+60 if birthmo==9
replace pbday = pbday+90 if birthmo==10
replace pbday = pbday+120 if birthmo==11
replace pbday = pbday+150 if birthmo==12

collapse (mean) standard_reading_score if ((yob == 1987 & birthmo >=7 & birthmo < . & year == 2000) | (yob == 1988 & birthmo <=6 & year == 2000) | (yob == 1994 & birthmo >=7 & birthmo < . & year == 2007) | (yob == 1995 & birthmo <=6 & year == 2007)) & everrepeated == 1, by(pbday birthmo_jul)
twoway lfitci standard_reading_score pbday if birthmo_jul == 1 || lfitci standard_reading_score pbday if birthmo_jul == 0 || /// 
sc standard_reading_score pbday if birthmo_jul == 1 || sc standard_reading_score pbday if birthmo_jul == 0, xtitle("Day of birth relative to June 30th cut-off") ytitle("Standardized reading score") xline(0) title("(b) Ever repeated a grade") legend(off)
graph save Graph "graph 2.dta", replace

graph combine "graph 1.dta" "graph 2.dta", col(2)
gr export "$figures/readingscore_sacmeq.jpg", replace 

**************************************************************************************
* (9) TIME IN NURSERY
**************************************************************************************

* Time in nursery among kids in Grade 6 in SACMEQ

use "$sacmeq_data/sacmeqiii_ii.dta", clear
keep if year == 2007
rdplot nursyrs birthmo, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Month of birth") ytitle("Time spent in nursery or pre-school (years)") xlabel(1(1)12) legend(off))
addplot: , text(.84 9.5 "RD: 0.236 (s.e.: 0.068) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
gr export "$figures/timeinnursery.jpg", replace 

**************************************************************************************
* (10) OUTCOMES FOR ACTUAL COHORT (BORN 1995-1999)
**************************************************************************************

**# Bookmark

* Educational attainment of actual cohort (by age in years)

use "$lesotho_census/census2006.dta", clear
keep if year == 2006
gen age_new = year - birthyr
collapse (mean) y=eduyrs if birthyr >= 1994 & birthyr <= 1999, by(age_new birthmo_jul)
twoway (line y age_new if birthmo_jul==1, legend(off) yscale(r(0/10))) (line y age_new if birthmo_jul==0, legend(off) title("(a) Census 2006") xtitle("Age (years)") ytitle("Total years of schooling completed") ylabel(0/10)) 
graph save Graph "graph 1.dta", replace

use "$dhs_data/dhspooled.dta", clear
keep if year == 2014
gen birthyr = v010 if fem == 1
replace birthyr = mv010 if fem == 0
gen age_new = year - birthyr
collapse (mean) y=eduyrs if birthyr >= 1994 & birthyr <= 1999, by(age_new birthmo_jul)
twoway (line y age_new if birthmo_jul==1, legend(off) yscale(r(0/10))) (line y age_new if birthmo_jul==0, legend(off) title("(b) DHS 2014") xtitle("Age (years)") ytitle("Total years of schooling completed") ylabel(0/10)) 
graph save Graph "graph 2.dta", replace

use "$mics2018_data/mics6hl.dta", clear
gen year = 2018
gen age_new = year - birthyr
collapse (mean) y=eduyrs if birthyr >= 1994 & birthyr <= 1999, by(age_new birthmo_jul)
twoway (line y age_new if birthmo_jul==1,  legend(order(1 "Born Jul-Dec" 2 "Born Jan-Jun")) legend(pos(0) bplacement(south))) (line y age_new if birthmo_jul==0, title("(c) MICS 2018") xtitle("Age (years)") ytitle("Total years of schooling completed") ylabel(0/10))
graph save Graph "graph 3.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta", col(3) 
gr export "$figures/actual_cohort_educ.jpg", replace 

**************************************************************************************
* (11) INTERGENERATIONAL
**************************************************************************************

use "$dhs_data/dhsbh.dta", clear // using DHS full birth history
keep if age_mother >= 18 
rdplot alive birthmo_mom, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Maternal month of birth") ytitle("Pr (child alive)") xlabel(1/12) legend(off) title((a) Child survival (DHS 2004-14)))
addplot: , text(.879 9.5 "RD: 0.011 (s.e.: 0.006) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 1.dta", replace

use "$dhs_data/dhswomen.dta", clear // using DHS women individual recode
keep if age >= 18
gen chdead = v201 - v218
gen chdeadprev = chdead > 0 & chdead < .
rdplot chdead birthmo, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Maternal month of birth") ytitle("number of children died") xlabel(1/12) legend(off) title((b) Number of children who have died)))
addplot: , text(.155 9.5 "RD: -0.045 (s.e.: 0.017) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 2.dta", replace

rdplot chdeadprev birthmo, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Maternal month of birth") ytitle("Pr (any offspring mortality)") xlabel(1/12) legend(off) title((c) Lifetime prevalence any offspring mortality)))
addplot: , text(.1235 9.5 "RD: -0.039 (s.e.: 0.011) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 3.dta", replace

use "$mics2018_data/micsbh.dta", clear // using MICS
keep if birthyr_mom < 2000 // more than 18 years
rdplot alive birthmo_mom, c(6.5) nbins(1000 1000) p(2) ci(95) graph_options(xtitle("Maternal month of birth") ytitle("Pr (child alive)") xlabel(1/12) legend(off) title((d) Child survival (MICS 2018))))
addplot: , text(.88 9.5 "RD: 0.023 (s.e.: 0.011) ", size(small)) xlabel(1 "Jan" 2 "Feb" 3 "Mar" 4 "Apr" 5 "May" 6 "Jun" 7 "Jul" 8 "Aug" 9 "Sep" 10 "Oct" 11 "Nov" 12 "Dec")
graph save Graph "graph 4.dta", replace

graph combine "graph 1.dta" "graph 2.dta" "graph 3.dta" "graph 4.dta", col(2) scale(1)
gr export "$figures/intergenerational.jpg", replace 

**************************************************************************************
* (12) BASUTOLAND REPORT
**************************************************************************************

* Data from the Annual Report of the Basutoland Director of Education for the year 1965
clear
import excel "$basutoland/Enrolment data.xlsx", sheet("Annual Enrolment") firstrow  

set scheme white_tableau 

encode AgeGroup, gen(age_group)
encode Gender, gen(gender)
encode Grade, gen(grade)

gen age = .
replace age = 5 if AgeGroup	==	"under 6"
replace age = 6 if AgeGroup ==	"6 to under 7"
replace age = 7 if AgeGroup ==	"7 to under 8"
replace age = 8 if AgeGroup ==	"8 to under 9"
replace age = 9 if AgeGroup ==	"9  to under 10"
replace age = 10 if AgeGroup ==	"10  to under 11"
replace age = 11 if AgeGroup ==	"11 to under 12"
replace age = 12 if AgeGroup ==	"12 to under 13"
replace age = 13 if AgeGroup ==	"13 to under 14"
replace age = 14 if AgeGroup ==	"14 to under 15"
replace age = 15 if AgeGroup ==	"15 to under 16"
replace age = 16 if AgeGroup ==	"16 to under 17"
replace age = 17 if AgeGroup ==	"17 to under 18"
replace age = 18 if AgeGroup ==	"18 to under 19"
replace age = 19 if AgeGroup ==	"19 to under 20"
replace age = 20 if AgeGroup ==	"Over 20"

label define agegroup 5 "under 6 years" 6 "6 years" 7 "7 years" 8 "8 years" 9 "9 years" ///
	10 "10 years" 11 "11 years" 12 "12 years" 13 "13 years" 14 "14 years" 15 "15 years" ///
	16 "16 years" 17 "17 years" 18 "18 years" 19 "19 years" 20 "20+ years"
lab values age agegroup

* Enrolment by Grade and age group
bysort age grade: egen age_grade_enrolment = total(Enrolment)
bysort age: egen age_enrolment = total(Enrolment)
bysort grade: egen grade_enrolment = total(Enrolment)
bysort age grade: gen grade_enrolment_rate_ = Enrolment/grade_enrolment
bysort age: gen age_enrolment_rate = Enrolment/age_enrolment

order AgeGroup age_group age Gender gender Grade grade

graph bar age_grade_enrolment if grade<=5,  over(age) over(Grade, label(angle(45))) ///
	asyvars yti("Enrolment", size(*0.9)) ti("Elementary school", size(*0.75)) ///
	note("Source: The Annual Report of the Basutoland Director of Education for the year 1965.", size(*0.80)) ///
	name(elem, replace)

graph bar age_grade_enrolment if grade<=5,  over(age) over(Grade, label(angle(45))) ///
	asyvars yti("Enrolment", size(*0.9)) ///
	name(elem, replace)
gr export "$figures/Basutoland.png", replace	

**************************************************************************************
* CLEAN FOLDER
**************************************************************************************

erase "graph 1.dta"
erase "graph 2.dta"
erase "graph 3.dta"
erase "graph 4.dta"
erase "graph 5.dta"
erase "graph 6.dta"
erase "graph 7.dta"
erase "graph 8.dta"

