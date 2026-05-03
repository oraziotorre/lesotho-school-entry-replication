********************************************************************
********************************************************************
********************************************************************
*** 1. CREATING TABLE 3 IN MAIN TEXT  
********************************************************************
********************************************************************
********************************************************************
clear
set more off


** This stretch of code re-creates the data preparation in "$P_Main/stata_8_preparing_RF_data.do", 
** but only focusing on downloads. The reason for this is that it manages to combine 
** aggregate (app-type) level and individual (app) level data. 

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
egen cat_id = group(cat_id_fin), label(,replace) 
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

** app age

gegen first_date = min(date), by(name_id)

gener age = date- first_date
drop first_date


** treatment effects 
gener treat_period = (date>=650)

gener treat_group = (game==1)
gener treat_dum = treat_period*treat_group

* 
gener l_downs = ln(monthly_pred_downloads+1)

fsort name_id date

label variable treat_dum "Games $\times$ Post"

** generating aggregate variables 
gegen tot_cat_downs = total(monthly_pred_downloads), by(cat_id date)
gegen tot_downs = total(monthly_pred_downloads), by(game date)

gegen min_id = min(name_id), by(game date)
gegen min_cat_id = min(name_id), by(cat_id date)
gener use_game = 1 if name_id==min_id
gener use_cat = 1 if name_id==min_cat_id
drop min_id min_cat_id
gener l_tot_cat_downs = ln(tot_cat_downs)

* apps with SPLIT categories - Arcade & Action, Card & Casino (Brain and Puzzle did not really split but change to Puzzle)
* of those... Arcade had WAY more apps than Action in pre- period, and Card had WAY more apps than Casino in pre
decode cat_id, gen(cat_id_string)

gener split_cats = 1 if cat_id_string=="Arcade" | cat_id_string=="Action" | cat_id_strin=="Card" | cat_id_string=="Casino"

gener small_split = 1 if cat_id_string=="Action" | cat_id_string=="Casino"
replace small_split = 0 if game==0
replace small_split = 0 if split_cats==1 & missing(small_split)
replace small_split = 0 if cat_id_string=="Adventure" | cat_id_string=="Board" | cat_id_string=="Educational" | cat_id_string=="Family" | cat_id_string=="Music" | cat_id_string=="Role Playing" | cat_id_string=="Simulation" | cat_id_string=="Strategy" | cat_id_string=="Trivia" | cat_id_string=="Word"

drop cat_id_string 

gener treat_dum_small_split = treat_dum*small_split
label variable treat_dum_small_split "Games $\times$ Post $\times$ Small Type"


** TABLE 3 IN TEXT 

* column 1 
reghdfe l_tot_cat_downs treat_dum treat_dum_small_split   if date>647 & date<652 & (split_cats==1 | game==0)  & use_cat==1, absorb(date cat_id) cluster(date  cat_id#treat_period)
outreg2 using "$P_Tables/Table_3",   replace label keep(treat_dum treat_dum_small_split) nonotes nocons noaster tex(frag) dec(3)

* column 2 

reghdfe l_downs treat_dum treat_dum_small_split avg_rating paid price if date>647 & date<652 & (split_cats==1 | game==0), absorb(name_id date age) cluster(date treat_period#cat_id)
outreg2 using "$P_Tables/Table_3",   append label keep(treat_dum treat_dum_small_split) nonotes nocons noaster tex(frag) dec(3)



* This code creates column 3 of Table 3 
* last piece of download evidence - number of apps in category diff on downloads for games only

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

* generate number of ACTUAL apps in your category in immediate pre-period (date==648 | date==649)
capture drop this_is_an_app
gener this_is_an_app = 1

gegen temp_n_apps = total(this_is_an_app) if (date==648 | date==649) & game==1, by(cat_id)
replace temp_n_apps = temp_n_apps/2
gegen n_apps_648_649 = max(temp_n_apps), by(name_id)
drop temp_n_apps

gegen temp_n_apps = total(this_is_an_app) if (date==650 | date==651) & game==1, by(cat_id)
replace temp_n_apps = temp_n_apps/2
gegen n_apps_650_651 = max(temp_n_apps), by(name_id)
drop temp_n_apps

gegen temp_mean_downs_pre = mean(monthly_pred_downloads) if  (date==648 | date==649) & game==1, by(name_id)
gegen mean_downs_pre = max(temp_mean_downs_pre), by(name_id)
drop temp_mean_downs_pre

gegen temp_mean_downs_post = mean(monthly_pred_downloads) if  (date==650 | date==651) & game==1, by(name_id)
gegen mean_downs_post = max(temp_mean_downs_post), by(name_id)
drop temp_mean_downs_post

gener diff_n_apps_pre_post = n_apps_650_651 - n_apps_648_649

gener diff_ln_apps_pre_post = ln(n_apps_650_651) - ln(n_apps_648_649)

gener diff_downs = mean_downs_post - mean_downs_pre
gener diff_l_downs = ln(mean_downs_post) - ln(mean_downs_pre)


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

**

label variable diff_ln_apps_pre_post "Post/Pre $\Delta$ ln(N Apps in Category)"

reghdfe diff_l_downs diff_ln_apps_pre_post avg_rating paid price if date==650 & game==1, absorb(dev_id cat_id age) 
outreg2 using "$P_Tables/Table_3",  append label  keep(diff_ln_apps_pre_post) nonotes nocons noaster tex(frag) dec(3)


********************************************************************
********************************************************************
********************************************************************
*** 2. CREATING TABLE 5 IN MAIN TEXT  
********************************************************************
********************************************************************
********************************************************************

clear
set more off

use "$P_Data_Processed/RF_data.dta"

capture drop cat_id_gameonly
gener cat_id_gameonly = cat_id
replace cat_id_gameonly = 0 if game==0

format date %tm


label variable treat_dum "Games $\times$ Post"
label variable treat_group "Games"



** Baseline Table 

reg l_n_new_apps treat_group treat_dum game#c.date i.date if use_game==1, robust
outreg2 using "$P_Tables/Table_5",  replace keep( treat_dum treat_group) label   nonotes nocons noaster tex(frag) dec(3)

reghdfe l_cat_n_new_apps treat_dum , absorb(cat_id date cat_id#c.date) cluster(treat_period#cat_id)
outreg2 using "$P_Tables/Table_5",  append keep( treat_dum) label   nonotes nocons noaster tex(frag) dec(3)
