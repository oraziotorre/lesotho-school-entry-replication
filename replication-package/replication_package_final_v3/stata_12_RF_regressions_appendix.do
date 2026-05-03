*** APPENDIX REDUCED FORM ANALYSIS 

** DOWNLOADS 

** This stretch of code re-creates the data preparation in "$P_Main/stata_8_preparing_RF_data.do", 
** but only focusing on downloads. The reason for this is that it manages to combine 
** aggregate (app-type) level and individual (app) level data. 
clear
set more off

use "$P_Data_Processed/monthly_app_data.dta"

egen cat_id = group(category), label 

fsort name date
by name date: keep if _n==1
decode cat_id, gen(cat_id_string)
by name: gener cat_id_fin = cat_id_string[_N] if game==1 
replace cat_id_fin = cat_id_string if game==0
drop cat_id_string 
drop cat_id 
* need to do something with 
gegen last_date = max(date), by(name_id)
merge m:1 name using "$P_Data_Processed/pre_exit_ML_categories.dta"
drop if _merge==2
replace cat_id_fin = cat_id_string if last_date<650 & _merge==3
drop cat_id_string 
* dropping rest of apps with unassigned categories 
drop if cat_id_fin=="" & _merge==1
drop _merge

* generating new numeric values for categories 
egen cat_id = group(cat_id_fin), label(, replace)
drop cat_id_fin 

merge m:1 name_id using "$P_Data_Processed/google.dta"
drop if google==1
drop _merge
drop google


capture drop size
merge 1:1 name date using "$P_Data_Processed/app_sizes.dta"
keep if _merge==3
drop _merge


merge 1:1 name date using "$P_Data_Processed/app_ratings.dta"
keep if _merge==3
drop _merge

drop update_date

gener l_size = ln(size)

* merge downloads 


merge 1:1 name date using "$P_Data_Processed/monthly_downloads_games.dta"
drop if _merge==2
drop _merge

rename monthly_pred_downloads monthly_pred_downloads_games

merge 1:1 name date using "$P_Data_Processed/monthly_downloads_nongames.dta"
drop if _merge==2
drop _merge

replace monthly_pred_downloads = monthly_pred_downloads_games if game==1

drop monthly_pred_downloads_games

gener l_downs = ln(monthly_pred_downloads+1)

* creates alternative measure of downloads based on changes in the number of app ratings month-to-month 

fsort name_id date
by name_id: gener downs_ratings = n_ratings - n_ratings[_n-1] if _n>1
by name_id: replace downs_ratings = 0 if _n==1
replace downs_ratings = 0 if downs_ratings<0

gener l_downs_ratings = ln(downs_ratings+1)

** app age

gegen first_date = min(date), by(name_id)

gener age = date- first_date
drop first_date


** treatment effects 
gener treat_period = (date>=650)

gener treat_group = (game==1)
gener treat_dum = treat_period*treat_group


label variable treat_dum "Games $\times$ Post"
label variable treat_group "Games"

** placebo time period variables

* placebo treatment for Nov 2013 - Feb 2014 
gener treat_dum_placebo_p = treat_group*(date>648)

label variable treat_dum_placebo_p "Games $\times$ Placebo Post"

* placebo treatment for Mar 2014 - Jun 2014
gener treat_period_placebo = 0 if date==650 | date==651
replace treat_period_placebo = 1 if date==652 | date==653
gener treat_dum_placebo = treat_period_placebo*treat_group

label variable treat_dum_placebo "Games $\times$ Placebo Post"

** generating aggregate variables 
gegen tot_cat_downs = total(monthly_pred_downloads), by(cat_id date)
gegen tot_downs = total(monthly_pred_downloads), by(game date)

gegen temp_downs_new = total(monthly_pred_downloads) if age==0, by(cat_id date)
gegen tot_cat_downs_new = max(temp_downs_new), by(cat_id date) 
drop temp_downs_new

gegen temp_downs_new = total(monthly_pred_downloads) if age==0, by(game date)
gegen tot_downs_new = max(temp_downs_new), by(game date) 
drop temp_downs_new

gegen temp_downs_paid = total(monthly_pred_downloads) if paid==1, by(cat_id date)
gegen tot_cat_downs_paid = max(temp_downs_paid), by(cat_id date)
drop temp_downs_paid

gegen tot_downs_ratings = total(downs_ratings), by(game date)
gegen temp_tot_downs_ratings = total(downs_ratings) if age>0, by(game date)
gegen tot_downs_ratings_v2 = max(temp_tot_downs_ratings), by(game date)
drop temp_tot_downs_ratings
gegen tot_cat_downs_ratings = total(downs_ratings), by(cat_id date)
gegen temp_tot_downs_ratings = total(downs_ratings) if age>0, by(game date)
gegen tot_cat_downs_ratings_v2 = max(temp_tot_downs_ratings), by(game date)
drop temp_tot_downs_ratings

gegen min_id = min(name_id), by(game date)
gegen min_cat_id = min(name_id), by(cat_id date)
gener use_game = 1 if name_id==min_id
gener use_cat = 1 if name_id==min_cat_id
drop min_id min_cat_id
gener l_tot_downs =ln(tot_downs)
gener l_tot_cat_downs = ln(tot_cat_downs)
gener l_tot_downs_new = ln(tot_downs_new)
gener l_tot_cat_downs_new = ln(tot_cat_downs_new)
gener l_tot_downs_ratings = ln(tot_downs_ratings)
gener l_tot_downs_ratings_v2 = ln(tot_downs_ratings_v2)
gener l_tot_cat_downs_ratings = ln(tot_cat_downs_ratings)
gener l_tot_cat_downs_ratings_v2 = ln(tot_cat_downs_ratings_v2)
gener l_tot_cat_downs_paid = ln(tot_cat_downs_paid)

* apps with category names that did not exist before should be more affected
* these are: Adventure, Board, Education, Family, Music, Role Playing, Simulation, Strategy, Trivia and Word.

decode cat_id, gen(cat_id_string)


gener did_not_exist_pre = 1 if cat_id_string=="Adventure" | cat_id_string=="Board" | cat_id_string=="Educational" | cat_id_string=="Family" | cat_id_string=="Music" | cat_id_string=="Role Playing" | cat_id_string=="Simulation" | cat_id_string=="Strategy" | cat_id_string=="Trivia" | cat_id_string=="Word"
replace did_not_exist_pre = 0 if missing(did_not_exist_pre)

gener treat_dum_dnexist = treat_dum*did_not_exist_pre
label variable treat_dum_dnexist "Games $\times$ Post $\times$ Type Did Not Exist"

** generate good control group for these app types 
gener this_is_an_app = 1 
gegen n_apps_cat = total(this_is_an_app), by(cat_id date)
gegen n_apps_cat_2013_temp = mean(n_apps_cat) if year==2013, by(cat_id)
gegen n_apps_cat_2013 = max(n_apps_cat_2013_temp), by(cat_id)
drop n_apps_cat_2013_temp
gener l_n_apps_cat_2013 = ln(n_apps_cat_2013)


* apps with SPLIT categories - Arcade & Action, Card & Casino (Brain and Puzzle did not really split but change to Puzzle)
* of those... Arcade had WAY more apps than Action in pre- period, and Card had WAY more apps than Casino in pre

gener split_cats = 1 if cat_id_string=="Arcade" | cat_id_string=="Action" | cat_id_strin=="Card" | cat_id_string=="Casino"

gener small_split = 1 if cat_id_string=="Action" | cat_id_string=="Casino"
replace small_split = 0 if game==0
replace small_split = 0 if split_cats==1 & missing(small_split)
replace small_split = 0 if did_not_exist_pre==1

drop cat_id_string 


gener treat_dum_small_split = treat_dum*small_split
label variable treat_dum_small_split "Games $\times$ Post $\times$ Small Type"


* placebos
gener treat_dum_placebo_dnexist = treat_dum_placebo*did_not_exist_pre
label variable treat_dum_placebo_dnexist "Games $\times$ Placebo Post $\times$ Type Did Not Exist"

gener treat_dum_placebo_small_split = treat_dum_placebo*small_split
label variable treat_dum_placebo_small_split "Games $\times$ Placebo Post $\times$ Small Type"

gener treat_dum_placebo_p_dnexist = treat_dum_placebo_p*did_not_exist_pre
label variable treat_dum_placebo_dnexist "Games $\times$ Placebo Post $\times$ Type Did Not Exist"

gener treat_dum_placebo_p_small_split = treat_dum_placebo_p*small_split
label variable treat_dum_placebo_small_split "Games $\times$ Placebo Post $\times$ Small Type"



********************************************************************
********************************************************************
********************************************************************
*** DOWNLOAD TABLES 
********************************************************************
********************************************************************
********************************************************************



** TABLE C1 - AVERAGE DOWNLOAD EFFECTS 

* Start with FULL SAMPLE
reg l_tot_downs treat_dum treat_group i.date game#c.date if use_game==1 & date>624, robust
outreg2 using "$P_Tables/Table_C1", replace keep(treat_dum treat_group) nonotes nocons noaster tex(frag) dec(3) label 

reghdfe l_tot_cat_downs treat_dum if use_cat==1 & date>624, cluster(cat_id#treat_period) absorb(date cat_id cat_id#c.date)
outreg2 using "$P_Tables/Table_C1", append keep(treat_dum) nonotes nocons noaster tex(frag) dec(3) label
 

reghdfe l_downs treat_dum avg_rating paid price, absorb(name_id date age cat_id#c.date) cluster(cat_id#treat_period )
outreg2 using "$P_Tables/Table_C1", append keep(treat_dum) nonotes nocons noaster tex(frag) dec(3) label

* Next, limited date sample columns
reghdfe l_tot_cat_downs treat_dum if date>647 & date<652 & use_cat==1, cluster(cat_id#treat_period date) absorb(cat_id date)
outreg2 using "$P_Tables/Table_C1", append keep(treat_dum) nonotes nocons noaster tex(frag) dec(3) label

reghdfe l_downs treat_dum avg_rating paid price if date>647 & date<652, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C1", append keep(treat_dum) nonotes nocons noaster tex(frag) dec(3) label


** TABLE C2 - INFORMATIVENESS EFFECTS  

reghdfe l_tot_cat_downs treat_dum treat_dum_dnexist if date>647 & date<652 & use_cat==1, absorb(date cat_id) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C2", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum treat_dum_dnexist)

reghdfe l_downs treat_dum treat_dum_dnexist avg_rating paid price if date>647 & date<652, absorb(name_id date age) cluster(date treat_period#cat_id)
outreg2 using "$P_Tables/Table_C2", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_dnexist)

* columns 3 and 4 restrict the sample, only looking at SMALLER game and non-game types... 
reghdfe l_tot_cat_downs treat_dum treat_dum_dnexist  if date>647 & date<652  & l_n_apps_cat_2013<9  & use_cat==1,  absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C2", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_dnexist)

reghdfe l_downs treat_dum treat_dum_dnexist avg_rating paid price if date>647 & date<652 & l_n_apps_cat_2013<9, absorb(name_id date age) cluster(date treat_period#cat_id)
outreg2 using "$P_Tables/Table_C2", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_dnexist)

** TABLE C3 - RESULTS USING ONLY FEBRUARY AND MARCH 

reghdfe l_tot_cat_downs treat_dum if date>648 & date<651 & use_cat==1, absorb(date cat_id) cluster(cat_id#treat_period)
outreg2 using "$P_Tables/Table_C3", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum)

reghdfe l_downs treat_dum avg_rating paid price if date>648 & date<651, absorb(name_id date age) cluster(cat_id#treat_period)
outreg2 using "$P_Tables/Table_C3", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum)

reghdfe l_tot_cat_downs treat_dum treat_dum_dnexist if date>648 & date<651 & use_cat==1, absorb(date cat_id) cluster(cat_id#treat_period)
outreg2 using "$P_Tables/Table_C3", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_dnexist)

reghdfe l_downs treat_dum treat_dum_dnexist avg_rating paid price if date>648 & date<651, absorb(name_id date age) cluster(cat_id#treat_period)
outreg2 using "$P_Tables/Table_C3", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_dnexist)

reghdfe l_tot_cat_downs treat_dum  treat_dum_small_split if date>648 & date<651 & (split_cats==1 | game==0)  & use_cat==1, absorb(date cat_id) cluster(cat_id#treat_period)
outreg2 using "$P_Tables/Table_C3", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_small_split)

reghdfe l_downs treat_dum  treat_dum_small_split avg_rating paid price if date>648 & date<651 & (split_cats==1 | game==0), absorb(name_id date age) cluster(cat_id#treat_period)
outreg2 using "$P_Tables/Table_C3", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_small_split)

* column 7 of Table C3 is added later -> pre/post analysis. 


** TABLE C4 - ALTERNATIVE TIME PERIODS 

* save this table in two panels: 
* panel (a) covers November 2013 - February 2014

reghdfe l_tot_cat_downs treat_dum_placebo_p if date>645 & date<650 & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4a", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum_placebo_p)

reghdfe l_downs treat_dum_placebo_p avg_rating paid price if date>645 & date<650, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p)

reghdfe l_tot_cat_downs treat_dum_placebo_p treat_dum_placebo_p_dnexist if date>645 & date<650  & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p treat_dum_placebo_p_dnexist)

reghdfe l_downs treat_dum_placebo_p treat_dum_placebo_p_dnexist avg_rating paid price if date>645 & date<650, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p treat_dum_placebo_p_dnexist)


reghdfe l_tot_cat_downs treat_dum_placebo_p treat_dum_placebo_p_small_split if date>645 & date<650 & (split_cats==1 | game==0)  & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p treat_dum_placebo_p_small_split)


reghdfe l_downs treat_dum_placebo_p treat_dum_placebo_p_small_split avg_rating paid price if date>645 & date<650 & (split_cats==1 | game==0), absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p treat_dum_placebo_p_small_split)

* panel (b) covers March 2014 - June 2014

reghdfe l_tot_cat_downs treat_dum_placebo if date>649 & date<654 & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4b", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum_placebo)

reghdfe l_downs treat_dum_placebo avg_rating paid price if date>649 & date<654, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo)

reghdfe l_tot_cat_downs treat_dum_placebo treat_dum_placebo_dnexist if date>649 & date<654  & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo treat_dum_placebo_dnexist)

reghdfe l_downs treat_dum_placebo treat_dum_placebo_dnexist avg_rating paid price if date>649 & date<654, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo treat_dum_placebo_dnexist)


reghdfe l_tot_cat_downs treat_dum_placebo treat_dum_placebo_small_split if date>649 & date<654 & (split_cats==1 | game==0)  & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo treat_dum_placebo_small_split)


reghdfe l_downs treat_dum_placebo treat_dum_placebo_small_split avg_rating paid price if date>649 & date<654 & (split_cats==1 | game==0), absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C4b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo treat_dum_placebo_small_split)

** TABLE C5 - PAID APP SAMPLE

* save this table in three panels: 

* panel (a) covers Jan 2014 - Apr 2014 (baseline period)

reghdfe l_tot_cat_downs_paid treat_dum if date>647 & date<652 & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5a", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum)

reghdfe l_downs treat_dum avg_rating paid price if date>647 & date<652 & paid==1, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum)

reghdfe l_tot_cat_downs_paid treat_dum treat_dum_dnexist if date>647 & date<652 & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_dnexist)

reghdfe l_downs treat_dum treat_dum_dnexist avg_rating paid price if date>647 & date<652 & paid==1, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_dnexist)

reghdfe l_tot_cat_downs_paid treat_dum  treat_dum_small_split if date>647 & date<652 & (split_cats==1 | game==0)  & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_small_split)

reghdfe l_downs treat_dum  treat_dum_small_split avg_rating paid price if date>647 & date<652 & (split_cats==1 | game==0) & paid==1, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_small_split)

* panel (b) covers November 2013 - February 2014

reghdfe l_tot_cat_downs_paid treat_dum_placebo_p if date>645 & date<650 & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5b", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum_placebo_p)

reghdfe l_downs treat_dum_placebo_p avg_rating paid price if date>645 & date<650  & paid==1, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p)

reghdfe l_tot_cat_downs_paid treat_dum_placebo_p treat_dum_placebo_p_dnexist if date>645 & date<650  & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p treat_dum_placebo_p_dnexist)

reghdfe l_downs treat_dum_placebo_p treat_dum_placebo_p_dnexist avg_rating paid price if date>645 & date<650  & paid==1, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p treat_dum_placebo_p_dnexist)

reghdfe l_tot_cat_downs_paid treat_dum_placebo_p  treat_dum_placebo_p_small_split if date>645 & date<650  & (split_cats==1 | game==0)  & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p treat_dum_placebo_p_small_split)


reghdfe l_downs treat_dum_placebo_p  treat_dum_placebo_p_small_split avg_rating paid price if date>645 & date<650  & (split_cats==1 | game==0) & paid==1, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p treat_dum_placebo_p_small_split)

* panel (c) covers March 2014 - June 2014
reghdfe l_tot_cat_downs_paid treat_dum_placebo if date>649 & date<654 & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5c", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum_placebo)

reghdfe l_downs treat_dum_placebo avg_rating paid price if date>649 & date<654  & paid==1, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5c", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo)

reghdfe l_tot_cat_downs_paid treat_dum_placebo treat_dum_placebo_dnexist if date>649 & date<654  & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5c", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo treat_dum_placebo_dnexist)

reghdfe l_downs treat_dum_placebo treat_dum_placebo_dnexist avg_rating paid price if date>649 & date<654  & paid==1, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5c", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo treat_dum_placebo_dnexist)

reghdfe l_tot_cat_downs_paid treat_dum_placebo  treat_dum_placebo_small_split if date>649 & date<654  & (split_cats==1 | game==0)  & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5c", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo treat_dum_placebo_small_split)


reghdfe l_downs treat_dum_placebo  treat_dum_placebo_small_split avg_rating paid price if date>649 & date<654  & (split_cats==1 | game==0) & paid==1, absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C5c", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo treat_dum_placebo_small_split)


** TABLE C6 - ALTERNATIVE OUTCOMES 

* save this table in four panels: 

* panel (a) uses the baseline outcome (predicted downloads) for ease of comparison

reghdfe l_tot_cat_downs treat_dum if use_cat==1 & date>647 & date<652 , cluster(date cat_id#treat_period) absorb(date cat_id)
outreg2 using "$P_Tables/Table_C6a", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum)

reghdfe l_downs treat_dum avg_rating paid price if date>647 & date<652 & (game==0 | did_not_exist_pre==1), absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum)

reghdfe l_tot_cat_downs treat_dum_placebo_p if date>645 & date<650 & use_cat==1 , absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p)

reghdfe l_downs treat_dum_placebo_p avg_rating paid price if date>645 & date<650 & (game==0 | did_not_exist_pre==1), absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p)


reghdfe l_tot_cat_downs treat_dum_placebo if date>649 & date<654 & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo)

reghdfe l_downs treat_dum_placebo avg_rating paid price if date>649 & date<654  & (game==0 | did_not_exist_pre==1), absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo)


* panel (b) uses the baseline outcome (predicted downloads) for new apps only  

reghdfe l_tot_cat_downs_new treat_dum if use_cat==1 & date>647 & date<652 , cluster(date cat_id#treat_period) absorb(date cat_id)
outreg2 using "$P_Tables/Table_C6b", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum)

reghdfe l_downs treat_dum avg_rating paid price if date>647 & date<652 & (game==0 | did_not_exist_pre==1) & age==0, absorb(cat_id date) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum)

reghdfe l_tot_cat_downs_new treat_dum_placebo_p if date>645 & date<650 & use_cat==1 , absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p)

reghdfe l_downs treat_dum_placebo_p avg_rating paid price if date>645 & date<650 & (game==0 | did_not_exist_pre==1) & age==0, absorb(cat_id date) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p)


reghdfe l_tot_cat_downs_new treat_dum_placebo if date>649 & date<654 & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo)

reghdfe l_downs treat_dum_placebo avg_rating paid price if date>649 & date<654  & (game==0 | did_not_exist_pre==1) & age==0, absorb(cat_id date) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6b", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo)


* panel (c) uses ratings based downloads  

reghdfe l_tot_cat_downs_ratings treat_dum if use_cat==1 & date>647 & date<652 , cluster(date cat_id#treat_period) absorb(date cat_id)
outreg2 using "$P_Tables/Table_C6c", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum)

reghdfe l_downs_ratings treat_dum avg_rating paid price if date>647 & date<652 & (game==0 | did_not_exist_pre==1), absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6c", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum)

reghdfe l_tot_cat_downs_ratings treat_dum_placebo_p if date>645 & date<650 & use_cat==1 , absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6c", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p)

reghdfe l_downs_ratings treat_dum_placebo_p avg_rating paid price if date>645 & date<650 & (game==0 | did_not_exist_pre==1), absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6c", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p)

reghdfe l_tot_cat_downs_ratings treat_dum_placebo if date>649 & date<654 & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6c", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo)

reghdfe l_downs_ratings treat_dum_placebo avg_rating paid price if date>649 & date<654  & (game==0 | did_not_exist_pre==1), absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6c", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo)

* panel (d) uses the absolute (not log) number of predicted downloads

reghdfe tot_cat_downs treat_dum if date>647 & date<652 & use_cat==1, cluster(cat_id#treat_period date) absorb(cat_id date)
outreg2 using "$P_Tables/Table_C6d", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum)

reghdfe monthly_pred_downloads treat_dum avg_rating paid price if date>647 & date<652  & (game==0 | did_not_exist_pre==1), absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6d", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum)

reghdfe tot_cat_downs treat_dum_placebo_p if  date>645 & date<650 & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6d", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p)

reghdfe monthly_pred_downloads treat_dum_placebo_p avg_rating paid price if date>645 & date<650 & (game==0 | did_not_exist_pre==1), absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6d", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo_p)

reghdfe tot_cat_downs treat_dum_placebo if date>649 & date<654 & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6d", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo)

reghdfe monthly_pred_downloads treat_dum_placebo avg_rating paid price if date>649 & date<654  & (game==0 | did_not_exist_pre==1), absorb(name_id date age) cluster(date cat_id#treat_period)
outreg2 using "$P_Tables/Table_C6d", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum_placebo)

******************************************************************************
******************************************************************************
** Pre/Post Comparisons - Figure C2, last column of Table C3, Table C7 and Table C11 
******************************************************************************
****************************************************************************** 
clear
set more off

use "$P_Data_Processed/monthly_app_data.dta"
keep if game==1
fsort name date
by name date: keep if _n==1

egen cat_id = group(category), label 
drop category


merge m:1 name_id using "$P_Data_Processed/google.dta"
drop if google==1
drop _merge
drop google


capture drop size
merge 1:1 name date using "$P_Data_Processed/app_sizes.dta"
keep if _merge==3
drop _merge


merge 1:1 name date using "$P_Data_Processed/app_ratings.dta"
keep if _merge==3
drop _merge


drop update_date

gener l_size = ln(size)


merge 1:1 name date using "$P_Data_Processed/monthly_downloads_games.dta"
drop if _merge==2
drop _merge

** app age

gegen first_date = min(date), by(name_id)

gener age = date- first_date
drop first_date

capture drop this_is_an_app
gener this_is_an_app = 1

* number of apps in an app's actual category in period 646-647
gegen temp_n_apps = total(this_is_an_app) if (date==646 | date==647) & game==1, by(cat_id)
replace temp_n_apps = temp_n_apps/2
gegen n_apps_646_647 = max(temp_n_apps), by(name_id)
drop temp_n_apps

* number of apps in an app's actual category in period 648-649
gegen temp_n_apps = total(this_is_an_app) if (date==648 | date==649) & game==1, by(cat_id)
replace temp_n_apps = temp_n_apps/2
gegen n_apps_648_649 = max(temp_n_apps), by(name_id)
drop temp_n_apps

* number of apps in an app's actual category in period 650-651
gegen temp_n_apps = total(this_is_an_app) if (date==650 | date==651) & game==1, by(cat_id)
replace temp_n_apps = temp_n_apps/2
gegen n_apps_650_651 = max(temp_n_apps), by(name_id)
drop temp_n_apps

* number of apps in an app's actual category in period 652-653
gegen temp_n_apps = total(this_is_an_app) if (date==652 | date==653) & game==1, by(cat_id)
replace temp_n_apps = temp_n_apps/2
gegen n_apps_652_653 = max(temp_n_apps), by(name_id)
drop temp_n_apps

* an app's mean downloads in period 648-649
gegen temp_mean_downs_pre = mean(monthly_pred_downloads) if  (date==648 | date==649) & game==1, by(name_id)
gegen mean_downs_pre = max(temp_mean_downs_pre), by(name_id)
drop temp_mean_downs_pre

* an app's mean downloads in period 650-651
gegen temp_mean_downs_post = mean(monthly_pred_downloads) if  (date==650 | date==651) & game==1, by(name_id)
gegen mean_downs_post = max(temp_mean_downs_post), by(name_id)
drop temp_mean_downs_post

* a paid app's mean price in period 648-649
gegen temp_mean_price = mean(price) if  (date==648 | date==649) & game==1 & paid==1, by(name_id)
gegen mean_price_pre = max(temp_mean_price), by(name_id)
drop temp_mean_price

* a paid app's mean price in period 650-651
gegen temp_mean_price = mean(price) if  (date==650 | date==651) & game==1 & paid==1, by(name_id)
gegen mean_price_post = max(temp_mean_price), by(name_id)
drop temp_mean_price

* calculating differences 
gener diff_n_apps_placebo_p = n_apps_648_649 - n_apps_646_647
gener diff_n_apps_pre_post = n_apps_650_651 - n_apps_648_649
gener diff_n_apps_placebo_post = n_apps_652_653 - n_apps_650_651 

gener diff_mean_price = mean_price_post - mean_price_pre
gener diff_ln_mean_price = ln(mean_price_post) - ln(mean_price_pre)


gener diff_ln_apps_placebo_p = ln(n_apps_648_649) - ln(n_apps_646_647)
gener diff_ln_apps_pre_post = ln(n_apps_650_651) - ln(n_apps_648_649)
gener diff_ln_apps_placebo_post = ln(n_apps_652_653) - ln(n_apps_650_651)

gener diff_downs = mean_downs_post - mean_downs_pre
gener diff_l_downs = ln(mean_downs_post) - ln(mean_downs_pre)


* Figure C2 
gegen p_99_placebo_p = pctile(diff_n_apps_placebo_p) if date==649, p(99)
gegen p_1_placebo_p = pctile(diff_n_apps_placebo_p) if date==649 ,p(1)

gegen p_99_pre_post = pctile(diff_n_apps_pre_post) if date==651, p(99)
gegen p_1_pre_post = pctile(diff_n_apps_pre_post) if date==651 ,p(1)

gegen p_99_placebo_post = pctile(diff_n_apps_placebo_post) if date==653, p(99)
gegen p_1_placebo_post = pctile(diff_n_apps_placebo_post) if date==653 ,p(1)

histogram diff_n_apps_placebo_p if date==649 & diff_n_apps_placebo_p>=p_1_placebo_p &diff_n_apps_placebo_p<=p_99_placebo_p , color(blue%50) xtitle("Difference in Number of Other Apps in Category") xscale(range(-70000 10000)) xlabel(-70000 (10000) 10000) width(1500)
gr export "$P_Figures/Figure_C2a.png", replace 

histogram diff_n_apps_pre_post if date==651 & diff_n_apps_pre_post>=p_1_pre_post &diff_n_apps_pre_post<p_99_pre_post , color(blue%50)  xtitle("Difference in Number of Other Apps in Category")  xscale(range(-70000 10000)) xlabel(-70000 (10000) 10000) width(1500)
gr export "$P_Figures/Figure_C2b.png", replace 

histogram diff_n_apps_placebo_post if date==653 & diff_n_apps_placebo_post>p_1_placebo_post &diff_n_apps_placebo_post<=p_99_placebo_post , color(blue%50)   xtitle("Difference in Number of Other Apps in Category")  xscale(range(-70000 10000)) xlabel(-70000 (10000) 10000) width(1500)
gr export "$P_Figures/Figure_C2c.png", replace 

** 
gegen n_apps_by_cat = total(this_is_an_app), by(cat_id date)
fsort name date
by name: gener diff_l_downs_649_650 = ln(monthly_pred_downloads)- ln(monthly_pred_downloads[_n-1]) if date==650
by name: gener diff_l_n_apps_649_650 = ln(n_apps_by_cat)- ln(n_apps_by_cat[_n-1]) if date==650


** Column 7 of TABLE C3 

label variable diff_l_n_apps_649_650 "Post/Pre $\Delta$ ln(N Apps)"

reghdfe diff_l_downs_649_650 diff_l_n_apps_649_650 avg_rating paid price if date==650 & game==1, absorb(dev_id cat_id age) cluster(dev_id cat_id)
outreg2 using "$P_Tables/Table_C3", nonotes nocons noaster tex(frag) dec(3) label  append keep(diff_l_n_apps_649_650)



**
* getting app types 
fsort name date
by name date: keep if _n==1
decode cat_id, gen(cat_id_string)
by name: gener cat_id_fin = cat_id_string[_N] if game==1 
replace cat_id_fin = cat_id_string if game==0
drop cat_id_string 
drop cat_id 
* need to do something with 
gegen last_date = max(date), by(name_id)
merge m:1 name using "$P_Data_Processed/pre_exit_ML_categories.dta"
drop if _merge==2
replace cat_id_fin = cat_id_string if last_date<650 & _merge==3
drop cat_id_string 
* dropping rest of apps with unassigned categories 
drop if cat_id_fin=="" & _merge==1
drop _merge

* generating new numeric values for categories 
egen cat_id = group(cat_id_fin), label(,replace)

*drop cat_id_fin 
**



** TABLE C7

* last two periods' avg nubmer of apps in an app's category
capture drop n_apps_658_659 
gegen temp_n_apps = total(this_is_an_app) if (date==658 | date==659) & game==1, by(cat_id)
replace temp_n_apps = temp_n_apps/2
gegen n_apps_658_659 = max(temp_n_apps), by(name_id)
drop temp_n_apps

* last two periods' mean number of downloads for an app
capture drop mean_downs_fin 
gegen temp_mean_downs = mean(monthly_pred_downloads) if  (date==658 | date==659) & game==1, by(name_id)
gegen mean_downs_fin = max(temp_mean_downs), by(name_id)
drop temp_mean_downs

* calculatign differences with March/April 2014 
capture drop diff_ln_apps_post_fin
capture drop diff_l_downs_post_fin
gener diff_ln_apps_post_fin = ln(n_apps_658_659) - ln(n_apps_650_651)
gener diff_l_downs_post_fin = ln(mean_downs_fin) - ln(mean_downs_post)

label variable diff_ln_apps_post_fin "Dec/Mar $\Delta$ ln(N Apps)"

reghdfe diff_l_downs_post_fin diff_ln_apps_post_fin avg_rating paid price if date==659 & game==1 , absorb(dev_id age) cluster(dev_id)
outreg2 using "$P_Tables/Table_C7", nonotes nocons noaster tex(frag) dec(3) label  replace keep( diff_ln_apps_post_fin)


*** TABLE C11 

label variable diff_ln_apps_pre_post "Post/Pre $\Delta$ ln(N Apps in Category)"

reghdfe diff_ln_mean_price diff_ln_apps_pre_post avg_rating if date==650 & game==1 & paid==1, absorb(dev_id cat_id age) cluster(dev_id cat_id)
outreg2 using "$P_Tables/Table_C11", nonotes nocons noaster tex(frag) dec(3) label  replace keep(diff_ln_apps_pre_post)


reghdfe diff_mean_price diff_ln_apps_pre_post avg_rating if date==650 & game==1 & paid==1, absorb(dev_id cat_id age) cluster(dev_id cat_id)
outreg2 using "$P_Tables/Table_C11", nonotes nocons noaster tex(frag) dec(3) label  append keep(diff_ln_apps_pre_post)

******************************************************************************
******************************************************************************
******************************************************************************


*** ENTRY 

clear
set more off

use "$P_Data_Processed/RF_data.dta"

capture drop cat_id_gameonly
gener cat_id_gameonly = cat_id
replace cat_id_gameonly = 0 if game==0

format date %tm


label variable treat_dum "Games $\times$ Post"
label variable treat_group "Games"


** Table B4 (summary stats)
cd "$P_Tables"
label variable cat_n_apps "Number of Apps"
label variable cat_n_new_apps "Number of New Apps"
sutex2 cat_n_apps cat_n_new_apps if game==1, varlab saving(Table_B4.tex) replace 
sutex2 cat_n_apps cat_n_new_apps if game==0, varlab saving(Table_B4.tex) append  

** 

* apps with category names that did not exist before should be more affected
* these are: Adventure, Board, Education, Family, Music, Role Playing, Simulation, Strategy, Trivia and Word.
capture drop cat_id_string 
decode cat_id, gen(cat_id_string) 


gener did_not_exist_pre = 1 if cat_id_string=="Adventure" | cat_id_string=="Board" | cat_id_string=="Educational" | cat_id_string=="Family" | cat_id_string=="Music" | cat_id_string=="Role Playing" | cat_id_string=="Simulation" | cat_id_string=="Strategy" | cat_id_string=="Trivia" | cat_id_string=="Word"
replace did_not_exist_pre = 0 if missing(did_not_exist_pre)

gener treat_dum_dnexist = treat_dum*did_not_exist_pre
label variable treat_dum_dnexist "Games $\times$ Post $\times$ Type Did Not Exist"

* apps with SPLIT categories - Arcade & Action, Card & Casino (Brain and Puzzle did not really split but change to Puzzle)
* of those... Arcade had WAY more apps than Action in pre- period, and Card had WAY more apps than Casino in pre

gener split_cats = 1 if cat_id_string=="Arcade" | cat_id_string=="Action" | cat_id_strin=="Card" | cat_id_string=="Casino"

gener small_split = 1 if cat_id_string=="Action" | cat_id_string=="Casino"
replace small_split = 0 if game==0
replace small_split = 0 if split_cats==1 & missing(small_split)
replace small_split = 0 if did_not_exist_pre==1

gener treat_dum_small_split = treat_dum*small_split
label variable treat_dum_small_split "Games $\times$ Post $\times$ Small Type"

drop cat_id_string 

** TABLE C8 - ENTRY MECHANISMS 

reghdfe l_cat_n_new_apps treat_dum treat_dum_dnexist, absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_C8", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_dum treat_dum_dnexist)

reghdfe l_cat_n_new_apps treat_dum treat_dum_small_split    if  (split_cats==1 | game==0), absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_C8", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_small_split)

*** TABLE C9 - ENTRY RESULTS WITH THE ABSOLUTE NUMBER OF ENTRANTS AS OUTCOME 

* absolute entry 
reg n_new_apps treat_group treat_dum game#c.date i.date if use_game==1, robust
outreg2 using "$P_Tables/Table_C9", nonotes nocons noaster tex(frag) dec(3) label  replace keep(treat_group treat_dum)

reghdfe cat_n_new_apps treat_dum , absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_C9", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum)

reghdfe cat_n_new_apps treat_dum treat_dum_dnexist, absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_C9", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_dnexist)

reghdfe cat_n_new_apps treat_dum treat_dum_small_split    if  (split_cats==1 | game==0), absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_C9", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum treat_dum_small_split)


*** PRICES 

** TABLE C10 

* save this table in two panels: 

* panel (a) uses prices for all paid apps

reg mean_price treat_group treat_dum game#c.date i.date if use_game==1, robust
outreg2 using "$P_Tables/Table_C10a", nonotes nocons noaster tex(frag) dec(3) label replace keep( treat_dum treat_group)

reghdfe cat_mean_price treat_dum , absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_C10a", nonotes nocons noaster tex(frag) dec(3) label  append keep(treat_dum)
 
reghdfe cat_mean_price treat_dum treat_dum_dnexist, absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_C10a", nonotes nocons noaster tex(frag) dec(3) label append keep(treat_dum treat_dum_dnexist)
  
reghdfe cat_mean_price treat_dum treat_dum_small_split if  (split_cats==1 | game==0), absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_C10a", nonotes nocons noaster tex(frag) dec(3) label append keep(treat_dum treat_dum_small_split)
 
* panel (b) uses prices only for new apps 

* new paid app prices
reg new_mean_price treat_group treat_dum game#c.date i.date if use_game==1, robust
outreg2 using "$P_Tables/Table_C10b", nonotes nocons noaster tex(frag) dec(3) label replace keep( treat_dum treat_group)

reghdfe new_cat_mean_price treat_dum , absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_C10b", nonotes nocons noaster tex(frag) dec(3) label append keep(treat_dum)
 
reghdfe new_cat_mean_price treat_dum treat_dum_dnexist, absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_C10b", nonotes nocons noaster tex(frag) dec(3) label append keep(treat_dum treat_dum_dnexist)
  
reghdfe new_cat_mean_price treat_dum treat_dum_small_split    if  (split_cats==1 | game==0), absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_C10b", nonotes nocons noaster tex(frag) dec(3) label append keep(treat_dum treat_dum_small_split)

******************************************************************************
******************************************************************************
******************************************************************************

*** TIMING TEST FIGURES ***


** DOWNLOADS 
capture drop l_tot_downs
gener l_tot_downs= ln(tot_downs)
capture drop l_tot_cat_downs 
gener l_tot_cat_downs= ln(tot_downs_cat)

preserve 

reg l_tot_downs treat_time_p* treat_time_m1-treat_time_m10  datedum3-datedum35  game game#c.date if use_game==1, vce(robust) 

parmest, stars(0.1 0.05 0.01) level(95) norestore fast

gen keep = strmatch(parm, "treat_time*")

keep if keep==1
drop keep

gener xvar = 650 

local i = 9 
while `i'>-24 { 
	
	gener match = 0
	if `i'>=0 { 
		replace match = 1 if strmatch(parm, "treat_time_p`i'")
	}
	if `i'<0 {
		local absi = -`i'
		replace match = 1 if strmatch(parm, "treat_time_m`absi'")
	}

	replace xvar = 650+`i' if match==1
	local i = `i'-1
	drop match
}

format xvar %tm

tw (rcap min95 max95 xvar, color(gray)) ///
	(line estimate xvar, lcolor(dknavy )) ///
	(sc estimate xvar, m(O) mfcolor(dknavy) ///
	mlcolor(ltbluishgray) mlwidth(.4)), legend(off) xtitle("Date")  tline(2013m11, lpattern(dash)) tline(2014m2)

gr export "$P_Figures/Figure_C1a.png", replace
	
restore

preserve 

reg l_tot_cat_downs treat_time_p* treat_time_m1-treat_time_m10  datedum3-datedum35 catdum* cat_id_gameonly#c.date, robust


parmest, stars(0.1 0.05 0.01) level(95) norestore fast

gen keep = strmatch(parm, "treat_time*")

keep if keep==1
drop keep

gener xvar = 650 

local i = 9 
while `i'>-24 { 
	
	gener match = 0
	if `i'>=0 { 
		replace match = 1 if strmatch(parm, "treat_time_p`i'")
	}
	if `i'<0 {
		local absi = -`i'
		replace match = 1 if strmatch(parm, "treat_time_m`absi'")
	}

	replace xvar = 650+`i' if match==1
	local i = `i'-1
	drop match
}

format xvar %tm

tw (rcap min95 max95 xvar, color(gray)) ///
	(line estimate xvar, lcolor(dknavy )) ///
	(sc estimate xvar, m(O) mfcolor(dknavy) ///
	mlcolor(ltbluishgray) mlwidth(.4)), legend(off) xtitle("Date") tline(2013m11, lpattern(dash)) tline(2014m2)

gr export "$P_Figures/Figure_C1b.png", replace
	
restore



**** ENTRY 

preserve 

reg l_n_new_apps treat_time_p* treat_time_m1-treat_time_m10  datedum3-datedum35  game game#c.date if use_game==1, vce(robust) 

parmest, stars(0.1 0.05 0.01) level(95) norestore fast

gen keep = strmatch(parm, "treat_time*")

keep if keep==1
drop keep

gener xvar = 650 

local i = 9 
while `i'>-24 { 
	
	gener match = 0
	if `i'>=0 { 
		replace match = 1 if strmatch(parm, "treat_time_p`i'")
	}
	if `i'<0 {
		local absi = -`i'
		replace match = 1 if strmatch(parm, "treat_time_m`absi'")
	}

	replace xvar = 650+`i' if match==1
	local i = `i'-1
	drop match
}

format xvar %tm

tw (rcap min95 max95 xvar, color(gray)) ///
	(line estimate xvar, lcolor(dknavy )) ///
	(sc estimate xvar, m(O) mfcolor(dknavy) ///
	mlcolor(ltbluishgray) mlwidth(.4)), legend(off) xtitle("Date")  tline(2013m11, lpattern(dash)) tline(2014m2)

gr export "$P_Figures/Figure_C3a.png", replace
	
restore



preserve 

reg l_cat_n_new_apps treat_time_p* treat_time_m1-treat_time_m10  datedum3-datedum35 catdum* cat_id_gameonly#c.date, robust


parmest, stars(0.1 0.05 0.01) level(95) norestore fast

gen keep = strmatch(parm, "treat_time*")

keep if keep==1
drop keep

gener xvar = 650 

local i = 9 
while `i'>-24 { 
	
	gener match = 0
	if `i'>=0 { 
		replace match = 1 if strmatch(parm, "treat_time_p`i'")
	}
	if `i'<0 {
		local absi = -`i'
		replace match = 1 if strmatch(parm, "treat_time_m`absi'")
	}

	replace xvar = 650+`i' if match==1
	local i = `i'-1
	drop match
}

format xvar %tm

tw (rcap min95 max95 xvar, color(gray)) ///
	(line estimate xvar, lcolor(dknavy )) ///
	(sc estimate xvar, m(O) mfcolor(dknavy) ///
	mlcolor(ltbluishgray) mlwidth(.4)), legend(off) xtitle("Date") tline(2013m11, lpattern(dash)) tline(2014m2)

gr export "$P_Figures/Figure_C3b.png", replace
	
restore


*** PRICES 

preserve
	keep if use_game==1
	
	gener share_new_paid_apps = n_new_paid_app /n_new_apps
	
	sort date game
	
	by date: gener share_new_paid_apps_ratio = share_new_paid_apps[2]/share_new_paid_apps[1]
	by date: gener mean_price_ratio = mean_price[2]/mean_price[1]
	by date: gener new_mean_price_ratio = new_mean_price[2]/new_mean_price[1]
	
	format date %tm
	
	tw (line mean_price_ratio date if game==1), xtitle("Date") ytitle("") tline(2013m11, lpattern(dash)) tline(2014m2)
	gr export "$P_Figures/Figure_C4a.png", replace	

	tw (line new_mean_price_ratio date if game==1), xtitle("Date") ytitle("") tline(2013m11, lpattern(dash)) tline(2014m2)
	gr export "$P_Figures/Figure_C4b.png", replace
	
	tw (line share_new_paid_apps_ratio date if game==1), xtitle("Date") ytitle("") tline(2013m11, lpattern(dash)) tline(2014m2)
	gr export "$P_Figures/Figure_C4c.png", replace

	
restore

