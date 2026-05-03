* TABLE 2 - SUMMARY STATISTICS

* this table has several parts - the first part uses game and non-game data
*                              - the second part uses only game data

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

merge 1:1 name date using "$P_Data_Processed/n_screenshots_videos.dta"
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



********* 

* Table 2 

* first two rows only have app level data
hashsort name date
by name: gener use_name=1 if _n==1

cd "$P_Tables"

label variable game "Game App Dummy"
label variable paid "Paid App Dummy"
sutex2 game paid if use_name==1, varlab digits(3) saving(Table_2.tex) replace 

* next 6 rows have app-month level data

label variable min_download "Lifetime Downloads (Min)"
label variable size "App Size (in MB)"
label variable monthly_pred_downloads "Monthly Predicted Downloads"
label variable n_screenshots "Number of Screenshots"
label variable n_videos "Number of Videos"
label variable avg_rating "Mean Rating"
label variable price "Price (for Paid Apps)"

sutex2 min_download size monthly_pred_downloads n_screenshots n_videos avg_rating, varlab digits(3) saving(Table_2.tex) append 

sutex2 price if paid==1, varlab digits(3) saving(Table_2.tex) append


*********

* for next 7 rows, merge sample from baseline model 

merge 1:1 name date using "$P_Data_Processed/model_sample.dta"
keep if _merge==3
drop _merge 


hashsort name date
by name: gener lag_min_download = min_download[_n-1]
by name: replace lag_min_download = 0 if _n==1

replace monthly_pred_downloads = 0 if monthly_pred_downloads>max_download
replace monthly_pred_downloads = 0 if monthly_pred_downloads +lag_min_download>max_download


sutex2 min_download size monthly_pred_downloads n_screenshots n_videos avg_rating, var digits(3) saving(Table_2.tex) append 
sutex2 price if paid==1, varlab digits(3) saving(Table_2.tex) append


