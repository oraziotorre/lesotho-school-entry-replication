clear
set more off

** predicted categories **
clear
set more off

use "$P_Data_Processed/monthly_app_data.dta"
keep if game==1

egen cat_id = group(category), label 

gener cat_id_act = cat_id

drop category

hashsort name date
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
egen cat_id_pred = group(cat_id_fin), label(,replace)
drop cat_id_fin 

* also keeping the "actual" category structure
rename cat_id_act cat_id 

capture drop size

merge 1:1 name date using "$P_Data_Processed/app_sizes.dta"
keep if _merge==3
drop _merge


merge 1:1 name date using "$P_Data_Processed/app_ratings.dta"
keep if _merge==3
drop _merge

gener dummy_5star = (avg_rating>=4.75)
gener dummy_45star = (avg_rating>=4.25 & avg_rating<4.75)
gener dummy_4star = (avg_rating>=3.75 & avg_rating<4.25)
gener dummy_35star = (avg_rating>=3.25 & avg_rating<3.75)
gener dummy_3star = (avg_rating>=2.75 & avg_rating<3.25)
gener dummy_25star = (avg_rating>=2.25 & avg_rating<2.75)
gener dummy_2star = (avg_rating>=1.75 & avg_rating<2.25)

merge 1:1 name date using "$P_Data_Processed/n_screenshots_videos.dta"
keep if _merge==3
drop _merge

merge 1:1 name date using "$P_Data_Processed/monthly_downloads_games.dta"
keep if _merge==3
drop _merge


hashsort name date
by name: gener lag_min_download = min_download[_n-1]
by name: replace lag_min_download = 0 if _n==1

replace monthly_pred_downloads = 0 if monthly_pred_downloads>max_download
replace monthly_pred_downloads = 0 if monthly_pred_downloads +lag_min_download>max_download



gegen tot_pred_downs = total(monthly_pred_downloads), by(date)
egen max_tot_pred_downs = max(tot_pred_downs)
replace max_tot_pred_downs = 2* max_tot_pred_downs

gener outside_downs = max_tot_pred_downs - tot_pred_downs


*** 


* Gandhi et al (2014) method of dealing with zeroes *

replace monthly_pred_downloads = monthly_pred_downloads

replace outside_downs = outside_downs

gener monthly_pred_downloads_g = monthly_pred_downloads+1
gener outside_downs_g = outside_downs+1
***


gener ly = ln(monthly_pred_downloads) - ln(outside_downs)
gener ly_g = ln(monthly_pred_downloads_g) - ln(outside_downs_g)

gener l_size = ln(size)

***
hashsort cat_id date paid
by cat_id date paid: gener n_apps = _N
gener l_n_apps = ln(n_apps)

gener l_n_apps_paid = l_n_apps*paid

gener post = (date>=650)


rename l_n_apps ln_act_n_apps
rename l_n_apps_paid ln_act_n_apps_paid
rename n_apps n_act_apps


hashsort cat_id_pred date paid
by cat_id_pred date paid: gener n_apps = _N
gener l_n_apps = ln(n_apps)

gener l_n_apps_paid = l_n_apps*paid


 *** 
 
 * past variables * 
 
hashsort name date

 by name: gener first_date = date[1]
 gener age = date - first_date
 gener age_sq = age*age
 gener new_app = (date==first_date)
 
 by name: gener lag_age = age[_n-1]
 by name: gener lag_age_sq = age_sq[_n-1]
 
 by name: gener lag_downs = monthly_pred_downloads[_n-1]
 by name: gener lag2_downs = monthly_pred_downloads[_n-2]
 by name: gener lag3_downs = monthly_pred_downloads[_n-3]
 gener l_lag_downs = ln(lag_downs)
 gener l_lag2_downs = ln(lag2_downs)
 gener l_lag3_downs = ln(lag3_downs)
 
  by name: gener lag_downs_g = monthly_pred_downloads_g[_n-1]
 by name: gener lag2_downs_g = monthly_pred_downloads_g[_n-2]
 by name: gener lag3_downs_g = monthly_pred_downloads_g[_n-3]
 gener l_lag_downs_g = ln(lag_downs_g)
 gener l_lag2_downs_g = ln(lag2_downs_g)
 gener l_lag3_downs_g = ln(lag3_downs_g)
 
 by name: gener lag_l_n_apps = l_n_apps[_n-1]
 
 
 by name: replace l_lag_downs= 0  if _n==1
  by name: replace l_lag2_downs= 0  if _n==1
 by name: replace l_lag3_downs= 0  if _n==1
 by name: replace l_lag_downs_g= 0  if _n==1
  by name: replace l_lag2_downs_g= 0  if _n==1
 by name: replace l_lag3_downs_g= 0  if _n==1
 
 
 by name: gener l_lag_size = l_size[_n-1]
 by name: gener l_lag2_size = l_size[_n-2]
 by name: gener l_lag3_size = l_size[_n-3]
 
 by name: gener lag_ratings = avg_rating[_n-1]
 by name: gener lag2_ratings = avg_rating[_n-2]
 by name: gener lag3_ratings = avg_rating[_n-3]
 
 by name: gener lag_screenshots = n_screenshots[_n-1]
 by name: gener lag2_screenshots = n_screenshots[_n-2]
 by name: gener lag3_screenshots = n_screenshots[_n-3]

 
by name: gener l_lag_napps = l_n_apps[_n-1]
hashsort cat_id_pred paid date l_lag_napps
by cat_id_pred paid date: replace l_lag_napps = l_lag_napps[1]
replace l_lag_napps = . if date==650

hashsort name date
by name: gener l_lag2_napps = l_n_apps[_n-2]
 hashsort cat_id_pred paid date l_lag2_napps
by cat_id_pred paid date: replace l_lag2_napps = l_lag2_napps[1]
replace l_lag2_napps = . if date==651

hashsort name date
by name: gener l_lag3_napps = l_n_apps[_n-3]
hashsort cat_id_pred paid date l_lag3_napps
by cat_id_pred paid date: replace l_lag3_napps = l_lag3_napps[1]
replace l_lag3_napps = . if date==652
 
 hashsort name date
 by name: gener lag_ly = ly[_n-1]
 by name: gener lag2_ly = ly[_n-2]
 by name: gener lag3_ly = ly[_n-3]
 
  by name: gener lag_ly_g = ly_g[_n-1]
 by name: gener lag2_ly_g = ly_g[_n-2]
 by name: gener lag3_ly_g = ly_g[_n-3]
 
 by name: gener lag_price = price[_n-1]
 
 by name: gener d_n_screenshots = n_screenshots - n_screenshots[_n-1]
 by name: gener d_n_videos = n_videos - n_videos[_n-1]
 
 gener d_l_n_apps = l_n_apps - l_lag_napps
 gener d_ly = ly - lag_ly
 gener d_ly_g = ly_g - lag_ly_g
 gener d_size = l_size - l_lag_size
 gener d_price = price - lag_price
  gener d_age = age- lag_age
 gener d_age_sq = age_sq - lag_age_sq
 
 gener d_lag_downs = l_lag_downs - l_lag2_downs
gener d_lag2_downs = l_lag2_downs - l_lag3_downs

 ** past size IV **
 
gegen  tot_l_lag_size = total(l_lag_size), by(cat_id_pred date paid)
gegen  tot_l_lag2_size = total(l_lag2_size), by(cat_id_pred date paid)
gegen  tot_l_lag3_size = total(l_lag3_size), by(cat_id_pred date paid)

gegen agg_lag_ratings = total(lag_ratings), by(cat_id_pred date paid)
gegen agg_lag2_ratings = total(lag2_ratings), by(cat_id_pred date paid)
gegen agg_lag3_ratings = total(lag3_ratings), by(cat_id_pred date paid)

gegen agg_lag_screenshots = total(lag_screenshots), by(cat_id_pred date paid)
gegen agg_lag2_screenshots = total(lag2_screenshots), by(cat_id_pred date paid)
gegen agg_lag3_screenshots = total(lag3_screenshots), by(cat_id_pred date paid)

gener blpiv_lag_size = (tot_l_lag_size - l_lag_size)/(n_apps- 1)
gener blpiv_lag2_size = (tot_l_lag2_size - l_lag2_size)/(n_apps- 1)
gener blpiv_lag3_size = (tot_l_lag3_size - l_lag3_size)/(n_apps- 1)

gener blpiv_lag_ratings = (agg_lag_ratings - lag_ratings)/(exp(l_lag_napps)- 1)
gener blpiv_lag2_ratings = (agg_lag2_ratings - lag2_ratings)/(exp(l_lag2_napps)- 1)
gener blpiv_lag3_ratings = (agg_lag3_ratings - lag3_ratings)/(exp(l_lag3_napps)- 1)

gener blpiv_lag_screenshots = (agg_lag_screenshots - lag_screenshots)/(exp(l_lag_napps)-1)
gener blpiv_lag2_screenshots = (agg_lag2_screenshots - lag2_screenshots)/(exp(l_lag2_napps)-1)
gener blpiv_lag3_screenshots = (agg_lag3_screenshots - lag3_screenshots)/(exp(l_lag3_napps)-1)

gener d_lag_blpiv = blpiv_lag_size - blpiv_lag2_size 

gener d_lag_blpiv_ratings = blpiv_lag_ratings - blpiv_lag2_ratings 


gener d_lag2_blpiv = blpiv_lag2_size - blpiv_lag3_size

gener d_lag2_blpiv_ratings = blpiv_lag2_ratings - blpiv_lag3_ratings

 **** 

 
  ** CURRENT BLP IV *** 
  
 capture drop dec_rating
 egen dec_rating = xtile(avg_rating), nq(10)
 
 capture drop dec_avg_rating
gegen dec_avg_rating = total(avg_rating), by(cat_id_pred date paid dec_rating)
 capture drop n_apps_dec_rating
 hashsort cat_id_pred date paid dec_rating 
 by cat_id_pred date  paid dec_rating: gener n_apps_dec_rating = _N
 
 capture drop dec_rating_iv
 gener dec_rating_iv = (dec_avg_rating - avg_rating)/(n_apps_dec_rating-1)
 
 capture drop dec_rating_iv2 
 gener dec_rating_iv2 = (dec_avg_rating - n_apps_dec_rating*avg_rating)/(n_apps_dec_rating-1)
 
 capture drop dec_size
 egen dec_size = xtile(size), nq(10)
 
 capture drop tot_dec_size
 gegen tot_dec_size = total(size), by(cat_id_pred date paid  dec_size)
 capture drop n_apps_dec_size
 hashsort cat_id_pred date paid dec_size
 by cat_id_pred date paid dec_size: gener n_apps_dec_size = _N
 
 capture drop dec_size_iv
 gener dec_size_iv = (tot_dec_size - size)/(n_apps_dec_size-1)
 
 
 capture drop dec_size_iv2 
 gener dec_size_iv2 = (tot_dec_size - n_apps_dec_size*size)/(n_apps_dec_size-1)
 
 capture drop dec_screenshots
 egen dec_screenshots = xtile(n_screenshots), nq(10)
 
 capture drop tot_dec_screenshots
 gegen tot_dec_screenshots = total(n_screenshots), by(cat_id_pred date paid  dec_screenshots)
 capture drop n_apps_dec_screenshots
 hashsort cat_id_pred date paid dec_screenshots
 by cat_id_pred date paid dec_screenshots: gener n_apps_dec_screenshots = _N
 
 capture drop dec_screenshots_iv
 gener dec_screenshots_iv = (tot_dec_screenshots - n_screenshots)/(n_apps_dec_screenshots-1)
 
 capture drop dec_screenshots_iv2 
 gener dec_screenshots_iv2 = (tot_dec_screenshots - n_apps_dec_screenshots*n_screenshots)/(n_apps_dec_screenshots-1)
 
gegen tot_l_size = total(l_size), by(cat_id_pred date paid)
gener blpiv_size = (tot_l_size - l_size)/(n_apps- 1)

gegen tot_n_screenshots = total(n_screenshots), by(cat_id_pred date paid)
gener blpiv_screenshots = (tot_n_screenshots - n_screenshots)/(n_apps- 1)

gegen tot_n_videos = total(n_videos), by(cat_id_pred date paid)
gener blpiv_videos = (tot_n_videos - n_videos)/(n_apps- 1)

gegen tot_n_avg_rating = total(avg_rating), by(cat_id_pred date paid)
gener blpiv_ratings = (tot_n_avg_rating - avg_rating)/(n_apps- 1)


hashsort name date

 by name: gener d_blpiv_ratings = blpiv_ratings - blpiv_ratings[_n-1]
 by name: gener d_blpiv_size = blpiv_size - blpiv_size[_n-1]
 by name: gener d_blpiv_screenshots = blpiv_screenshots - blpiv_screenshots[_n-1]


gegen tot_price = total(price), by(cat_id_pred date paid)
gener nevo_price = (tot_price - price)/(n_apps-1)

***************************
***************************

*** creating an IV for ln(n_apps)
* residual of regression of lags on current values.
capture drop lag_ln_n_act_apps
hashsort name date
by name: gener lag_ln_n_act_apps = ln_act_n_apps[_n-1]
hashsort cat_id paid date lag_ln_n_act_apps
by cat_id paid date: replace lag_ln_n_act_apps = lag_ln_n_act_apps[1]
replace lag_ln_n_act_apps = . if date==650
capture drop cat_n_downloads
gegen cat_n_downloads = total(monthly_pred_downloads), by(cat_id date paid)
capture drop l_cat_n_downloads
gener l_cat_n_downloads = ln(cat_n_downloads)
capture drop mean_cat_rating
gegen mean_cat_rating = mean(avg_rating), by(cat_id date paid)

capture drop use_cat
by cat_id paid date: gener use_cat = 1 if _n==1
 
capture drop resid_l_n_apps
reg ln_act_n_apps lag_ln_n_act_apps mean_cat_rating l_cat_n_downloads post paid i.cat_id#post if use_cat==1 , vce(robust)
 
predict resid_l_n_apps, residuals

sort cat_id paid date resid_l_n_apps
by cat_id paid date: replace resid_l_n_apps = resid_l_n_apps[1]


***************************
***************************


gener d_l_downs_g = ln(monthly_pred_downloads_g) - l_lag_downs_g

gener d_lag_l_downs_g = l_lag_downs_g - l_lag2_downs_g
gener d_lag2_l_downs_g = l_lag2_downs_g - l_lag3_downs_g


*****
* within group shares for nests *

****

***

capture drop cat_tot_pred_downs
gegen cat_tot_pred_downs = total(monthly_pred_downloads), by(date cat_id_pred paid)

capture drop l_within_cat_share
gener l_within_cat_share = ln(monthly_pred_downloads/cat_tot_pred_downs)

capture drop cat_tot_pred_downs_g
gegen cat_tot_pred_downs_g = total(monthly_pred_downloads_g), by(date cat_id_pred paid)

capture drop l_within_cat_share_g
gener l_within_cat_share_g= ln(monthly_pred_downloads_g/cat_tot_pred_downs_g)

capture drop d_within_cat_share_g
hashsort name date
by name: gener d_within_cat_share_g = l_within_cat_share_g - l_within_cat_share_g[_n-1]



*****
xtset name date



* include category x post fixed effects 
gegen cat_id_pred_post = group(cat_id_pred post)
tab cat_id_pred_post, gen(cat_id_pred_post_dum)
label variable cat_id_pred_post_dum1 "Action Pre"
label variable cat_id_pred_post_dum2 "Action Post"
label variable cat_id_pred_post_dum3 "Adventure Pre"
label variable cat_id_pred_post_dum4 "Adventure Post"
label variable cat_id_pred_post_dum5 "Arcade Pre"
label variable cat_id_pred_post_dum6 "Arcade Post"
label variable cat_id_pred_post_dum7 "Board Pre"
label variable cat_id_pred_post_dum8 "Board Post"
label variable cat_id_pred_post_dum9 "Card Pre"
label variable cat_id_pred_post_dum10 "Card Post"
label variable cat_id_pred_post_dum11 "Casino Pre"
label variable cat_id_pred_post_dum12 "Casino Post"
label variable cat_id_pred_post_dum13 "Casual Pre"
label variable cat_id_pred_post_dum14 "Casual Post"
label variable cat_id_pred_post_dum15 "Educational Pre"
label variable cat_id_pred_post_dum16 "Educational Post"
label variable cat_id_pred_post_dum17 "Family Pre"
label variable cat_id_pred_post_dum18 "Family Post"
label variable cat_id_pred_post_dum19 "Music Pre"
label variable cat_id_pred_post_dum20 "Music Post"
label variable cat_id_pred_post_dum21 "Puzzle Pre"
label variable cat_id_pred_post_dum22 "Puzzle Post"
label variable cat_id_pred_post_dum23 "Racing Pre"
label variable cat_id_pred_post_dum24 "Racing Post"
label variable cat_id_pred_post_dum25 "Role Playing Pre"
label variable cat_id_pred_post_dum26 "Role Playing Post"
label variable cat_id_pred_post_dum27 "Simulation Pre"
label variable cat_id_pred_post_dum28 "Simulation Post"
label variable cat_id_pred_post_dum29 "Sports Pre"
label variable cat_id_pred_post_dum30 "Sports Post"
label variable cat_id_pred_post_dum31 "Strategy Pre"
label variable cat_id_pred_post_dum32 "Strategy Post"
label variable cat_id_pred_post_dum33 "Trivia Pre"
label variable cat_id_pred_post_dum34 "Trivia Post"
label variable cat_id_pred_post_dum35 "Word Pre"
label variable cat_id_pred_post_dum36 "Word Post"

rename cat_id_pred_post_dum1 Action_Pre
rename cat_id_pred_post_dum2 Action_Post
rename cat_id_pred_post_dum3 Adventure_Pre
rename cat_id_pred_post_dum4 Adventure_Post
rename cat_id_pred_post_dum5 Arcade_Pre
rename cat_id_pred_post_dum6 Arcade_Post
rename cat_id_pred_post_dum7 Board_Pre
rename cat_id_pred_post_dum8 Board_Post
rename cat_id_pred_post_dum9 Card_Pre
rename cat_id_pred_post_dum10 Card_Post
rename cat_id_pred_post_dum11 Casino_Pre
rename cat_id_pred_post_dum12 Casino_Post
rename cat_id_pred_post_dum13 Casual_Pre
rename cat_id_pred_post_dum14 Casual_Post
rename cat_id_pred_post_dum15 Educational_Pre
rename cat_id_pred_post_dum16 Educational_Post
rename cat_id_pred_post_dum17 Family_Pre
rename cat_id_pred_post_dum18 Family_Post
rename cat_id_pred_post_dum19 Music_Pre
rename cat_id_pred_post_dum20 Music_Post
rename cat_id_pred_post_dum21 Puzzle_Pre
rename cat_id_pred_post_dum22 Puzzle_Post
rename cat_id_pred_post_dum23 Racing_Pre
rename cat_id_pred_post_dum24 Racing_Post
rename cat_id_pred_post_dum25 Role_Playing_Pre
rename cat_id_pred_post_dum26 Role_Playing_Post
rename cat_id_pred_post_dum27 Simulation_Pre
rename cat_id_pred_post_dum28 Simulation_Post
rename cat_id_pred_post_dum29 Sports_Pre
rename cat_id_pred_post_dum30 Sports_Post
rename cat_id_pred_post_dum31 Strategy_Pre
rename cat_id_pred_post_dum32 Strategy_Post
rename cat_id_pred_post_dum33 Trivia_Pre
rename cat_id_pred_post_dum34 Trivia_Post
rename cat_id_pred_post_dum35 Word_Pre
rename cat_id_pred_post_dum36 Word_Post


* everything is going to be relative to Casual pre
drop Casual_Pre


************


label variable ln_act_n_apps "$\gamma$"
label variable l_within_cat_share_g "$\sigma$"
label variable price "$\beta_{\text{price}}$"

**TABLE 4 **


* no ivs 
reghdfe  ly_g dummy_25star dummy_3star dummy_35star dummy_4star dummy_45star dummy_5star l_size  n_screenshots n_videos paid new_app  ///
Action_Pre Action_Post Adventure_Pre Adventure_Post Arcade_Pre Arcade_Post Board_Pre Board_Post  ///
Card_Pre Card_Post Casino_Pre Casino_Post Casual_Post Educational_Pre Educational_Post Family_Pre Family_Post ///
Music_Pre Music_Post Puzzle_Pre Puzzle_Post Racing_Pre Racing_Post Role_Playing_Pre Role_Playing_Post ///
Simulation_Pre Simulation_Post Sports_Pre Sports_Post Strategy_Pre Strategy_Post Trivia_Pre Trivia_Post Word_Pre Word_Post /// 
 l_within_cat_share_g price ln_act_n_apps l_lag_downs_g   if date!=650,absorb(dev_id year month age)  cluster(name_id)


outreg2 using "$P_Tables/Table_4", dec(3) tex(frag) label nonotes noaster  nor2 keep(price l_within_cat_share_g ln_act_n_apps) replace nocons

* only ivs for price + within share

ivreghdfe ly_g dummy_25star dummy_3star dummy_35star dummy_4star dummy_45star dummy_5star l_size  n_screenshots n_videos paid new_app  ///
Action_Pre Action_Post Adventure_Pre Adventure_Post Arcade_Pre Arcade_Post Board_Pre Board_Post  ///
Card_Pre Card_Post Casino_Pre Casino_Post Casual_Post Educational_Pre Educational_Post Family_Pre Family_Post ///
Music_Pre Music_Post Puzzle_Pre Puzzle_Post Racing_Pre Racing_Post Role_Playing_Pre Role_Playing_Post ///
Simulation_Pre Simulation_Post Sports_Pre Sports_Post Strategy_Pre Strategy_Post Trivia_Pre Trivia_Post Word_Pre Word_Post /// 
ln_act_n_apps (l_within_cat_share_g price  l_lag_downs_g = blpiv_ratings blpiv_size blpiv_screenshots   d_lag_l_downs_g dec_rating_iv2) if date!=650 ,absorb(dev_id year month age)  cluster(name_id)


outreg2 using "$P_Tables/Table_4", dec(3) tex(frag) label nonotes noaster  nor2 keep(price l_within_cat_share_g ln_act_n_apps) append  nocons


* only ivs for number of competitors 
ivreghdfe ly_g dummy_25star dummy_3star dummy_35star dummy_4star dummy_45star dummy_5star l_size  n_screenshots n_videos paid new_app  ///
Action_Pre Action_Post Adventure_Pre Adventure_Post Arcade_Pre Arcade_Post Board_Pre Board_Post  ///
Card_Pre Card_Post Casino_Pre Casino_Post Casual_Post Educational_Pre Educational_Post Family_Pre Family_Post ///
Music_Pre Music_Post Puzzle_Pre Puzzle_Post Racing_Pre Racing_Post Role_Playing_Pre Role_Playing_Post ///
Simulation_Pre Simulation_Post Sports_Pre Sports_Post Strategy_Pre Strategy_Post Trivia_Pre Trivia_Post Word_Pre Word_Post /// 
l_within_cat_share_g price ( ln_act_n_apps l_lag_downs_g = resid_l_n_apps  d_lag_l_downs_g) if date!=650 ,absorb(dev_id year month age)  cluster(name_id)


outreg2 using "$P_Tables/Table_4", dec(3) tex(frag) label nonotes noaster  nor2 keep(price l_within_cat_share_g ln_act_n_apps) append   nocons



 * ivs for number of competitors, price, and within share
ivreghdfe ly_g dummy_25star dummy_3star dummy_35star dummy_4star dummy_45star dummy_5star l_size  n_screenshots n_videos paid new_app  ///
Action_Pre Action_Post Adventure_Pre Adventure_Post Arcade_Pre Arcade_Post Board_Pre Board_Post  ///
Card_Pre Card_Post Casino_Pre Casino_Post Casual_Post Educational_Pre Educational_Post Family_Pre Family_Post ///
Music_Pre Music_Post Puzzle_Pre Puzzle_Post Racing_Pre Racing_Post Role_Playing_Pre Role_Playing_Post ///
Simulation_Pre Simulation_Post Sports_Pre Sports_Post Strategy_Pre Strategy_Post Trivia_Pre Trivia_Post Word_Pre Word_Post /// 
 (l_within_cat_share_g price ln_act_n_apps l_lag_downs_g = blpiv_ratings blpiv_size blpiv_screenshots resid_l_n_apps  d_lag_l_downs_g dec_rating_iv2) if date!=650 ,absorb(dev_id year month age)  cluster(name_id)



outreg2 using "$P_Tables/Table_4", dec(3) tex(frag) label nonotes noaster  nor2 keep(price l_within_cat_share_g ln_act_n_apps) append nocons

 
 gener sample = e(sample)

preserve 

keep if sample==1 
keep name date 
save "$P_Data_Processed/model_sample.dta", replace 

restore 
 
**********************************************
**********************************************
**** COUNTERFACTUAL SIMULATIONS **************
**********************************************
**********************************************
 
capture drop ln_coeff_var
gener ln_coeff_var = _b[ln_act_n_apps]
scalar b_past_downs = _b[l_lag_downs_g]

scalar b_price = _b[price]
scalar b_paid = _b[paid]

scalar sigma = _b[l_within_cat_share_g]

gener pre_cat_dummy = Action_Pre*_b[Action_Pre] + Adventure_Pre*_b[Adventure_Pre] + Arcade_Pre*_b[Arcade_Pre] ///
+ Board_Pre*_b[Board_Pre] + Card_Pre*_b[Card_Pre] + Casino_Pre*_b[Casino_Pre] + Educational_Pre*_b[Educational_Pre] ///
+ Family_Pre*_b[Family_Pre] + Music_Pre*_b[Music_Pre] + Puzzle_Pre*_b[Puzzle_Pre] + Racing_Pre*_b[Racing_Pre] ///
+ Role_Playing_Pre*_b[Role_Playing_Pre] + Simulation_Pre*_b[Simulation_Pre] + Sports_Pre*_b[Sports_Pre] + Strategy_Pre*_b[Strategy_Pre] ///
+ Trivia_Pre*_b[Trivia_Pre] + Word_Pre*_b[Word_Pre]

gener post_cat_dummy = Action_Post*_b[Action_Post] + Adventure_Post*_b[Adventure_Post] + Arcade_Post*_b[Arcade_Post] ///
+ Board_Post*_b[Board_Post] + Card_Post*_b[Card_Post] + Casino_Post*_b[Casino_Post] + Educational_Post*_b[Educational_Post] ///
+ Family_Post*_b[Family_Post] + Music_Post*_b[Music_Post] + Puzzle_Post*_b[Puzzle_Post] + Racing_Post*_b[Racing_Post] ///
+ Role_Playing_Post*_b[Role_Playing_Post] + Simulation_Post*_b[Simulation_Post] + Sports_Post*_b[Sports_Post] + Strategy_Post*_b[Strategy_Post] ///
+ Trivia_Post*_b[Trivia_Post] + Word_Post*_b[Word_Post]

gegen pre_cat_dummy_permanent = max(pre_cat_dummy), by(cat_id_pred)
gegen post_cat_dummy_permanent = max(post_cat_dummy), by(cat_id_pred)


** only need date = 649, 650 and 659
keep if date==649 | date==650 | date==659

* computing product deltas
capture drop delta
gener delta = _b[dummy_25star]*dummy_25star + _b[dummy_3star]*dummy_3star + _b[dummy_35star]*dummy_35star +_b[dummy_4star]*dummy_4star +_b[dummy_45star]*dummy_45star +_b[dummy_5star]*dummy_5star +_b[l_size]*l_size  +_b[n_screenshots]*n_screenshots + _b[n_videos]*n_videos + _b[paid]*paid +_b[price]*price  + _b[new_app]*new_app

capture drop exp_delta
gener exp_delta = exp(delta/(1-sigma))

scalar market_share_diff = 100
capture drop l_downs_pred
gener l_downs_pred = l_lag_downs_g

** this calculates "baseline" (true) levels of consumer welfare under actual number of entrants
** "full" = not accounting for congestion costs 

capture drop exp_delta_s_fe_pre 
gener exp_delta_s_fe_pre = exp_delta*exp( (ln_act_n_apps*ln_coeff_var + l_downs_pred*b_past_downs + pre_cat_dummy_permanent))


capture drop exp_delta_s_fe_post 
gener exp_delta_s_fe_post = exp_delta*exp( (ln_act_n_apps*ln_coeff_var + l_downs_pred*b_past_downs + post_cat_dummy_permanent))

* computing group values
capture drop group_value_pre 
capture drop group_value_post
capture drop group_value_full
capture drop group_value_sig_pre
capture drop group_value_sig_post
capture drop group_value_full_sig

gegen group_value_pre = total(exp_delta_s_fe_pre), by(cat_id_pred paid date)
gegen group_value_post = total(exp_delta_s_fe_post), by(cat_id_pred paid date)
gegen group_value_full = total(exp_delta), by(cat_id_pred paid date)
gener group_value_sig_pre = group_value_pre^(1-sigma) 
gener group_value_sig_post = group_value_post^(1-sigma) 
gener group_value_full_sig = group_value_full^(1-sigma)

* now getting total values
capture drop use
hashsort cat_id_pred paid date name_id
by cat_id_pred paid date: gener use = 1 if _n==1
replace use = 0 if missing(use)
capture drop group_value_sig_pre_use
gener group_value_sig_pre_use = group_value_sig_pre*use
capture drop group_value_sig_post_use
gener group_value_sig_post_use = group_value_sig_post*use
capture drop group_value_full_sig_use
gener group_value_full_sig_use = group_value_full_sig*use


capture drop cs_date_pre
capture drop cs_date_post
capture drop cs_date_full
gegen cs_date_pre = total(group_value_sig_pre_use), by(date)
replace cs_date_pre = 1+cs_date_pre
gegen cs_date_post = total(group_value_sig_post_use), by(date)
replace cs_date_post = 1+cs_date_post
capture drop l_cs_date_pre
gener l_cs_date_pre = ln(cs_date_pre)
capture drop l_cs_date_post
gener l_cs_date_post = ln(cs_date_post)

gegen cs_date_full = total(group_value_full_sig_use), by(date)
replace cs_date_full = 1 + cs_date_full
capture drop l_cs_date_full
gener l_cs_date_full = ln(cs_date_full)

* what apps were around in 649? 
capture drop present_649
gener present_649 = (date==649)
gegen max_present_649 = max(present_649), by(name_id)
drop present_649
rename max_present_649 present_649

capture drop cat_id_649
gener cat_id_649 = cat_id if date==649
hashsort name_id cat_id_649
by name_id: replace cat_id_649 = cat_id_649[1]

*********************************
*********************************

** simulating removing percentage of new entrants between March and December 2014 
** doing this 500 times to get a distribution of counterfactual effects 

local tosample = 100/(1+0.34)
display `tosample'

local i = 98034

local j = 1
scalar n_rand = 500

while `j'<=n_rand {
	
	local k = `i'+`j'
	set seed `k'
quietly {
	preserve 


		keep if date==659
		** start sampling
		sample `tosample' if present_649==0

		sum delta if present_649==0

		gener in_sample_659 = 1

		* new values
		capture drop n_apps_659
		gegen n_apps_659 = total(in_sample_659), by(cat_id paid date)
		capture drop exp_delta_search_659
		gener exp_delta_search_659 = exp_delta*exp( (ln(n_apps_659)*ln_coeff_var + l_lag_downs_g*b_past_downs) + post_cat_dummy_permanent)


		* group values
		capture drop group_value_659
		capture drop group_value_659_sig
		capture drop group_value_full_659
		capture drop group_value_full_659_sig
		gegen group_value_659 = total(exp_delta_search_659), by(cat_id_pred paid date)
		gegen group_value_full_659 = total(exp_delta), by(cat_id_pred paid date)
		gener group_value_659_sig = group_value_659^(1-sigma) 
		gener group_value_full_659_sig = group_value_full_659^(1-sigma)

		* now getting total values
		capture drop use
		hashsort cat_id_pred paid date name_id
		by cat_id_pred paid date: gener use = 1 if _n==1
		replace use = 0 if missing(use)
		capture drop group_value_659_use
		gener group_value_659_use = group_value_659_sig*use
		capture drop group_value_full_659_use
		gener group_value_full_659_use = group_value_full_659_sig*use

		capture drop cs_date_659
		capture drop cs_date_full_659
		gegen cs_date_659 = total(group_value_659_use), by(date)
		replace cs_date_659 = ln(1+cs_date_659)
		gegen cs_date_full_659 = total(group_value_full_659_use), by(date)
		replace cs_date_full_659 = ln(1+cs_date_full_659)
		
		** recompute downs/ market shares 

		scalar market_share_diff = 100
		capture drop l_downs_pred
		gener l_downs_pred = l_lag_downs_g
	
		* new values
		capture drop n_apps_659
		gegen n_apps_659 = total(in_sample_659), by(cat_id paid date)
		capture drop exp_delta_search_659
		gener exp_delta_search_659 = exp_delta*exp( (ln(n_apps_659)*ln_coeff_var + l_downs_pred*b_past_downs)  + post_cat_dummy_permanent)

		* group values
		capture drop group_value_659
		capture drop group_value_659_sig
		gegen group_value_659 = total(exp_delta_search_659), by(cat_id_pred paid date)
		gener group_value_659_sig = group_value_659^(1-sigma) 

		* now getting total values
		capture drop use
		hashsort cat_id_pred paid date name_id
		by cat_id_pred paid date: gener use = 1 if _n==1
		replace use = 0 if missing(use)
		capture drop group_value_659_use
		gener group_value_659_use = group_value_659_sig*use

		capture drop cs_date_659
		gegen cs_date_659 = total(group_value_659_use), by(date)
		replace cs_date_659 = ln(1+cs_date_659)

		gegen max_cs_659 = max(cs_date_659), by(name_id)
		gegen max_cs_full_659 = max(cs_date_full_659), by(name_id)

		quietly sum max_cs_659
		scalar cs_18cat_final`j' = r(mean)
		quietly sum max_cs_full_659
		scalar cs_18cat_full_final`j' = r(mean)
		
	restore 
}
local j = `j'+1
display `j'

}

quietly sum l_cs_date_post if date==659
scalar cs_18cat_final_real_post = r(mean)
quietly sum l_cs_date_full if date==659
scalar cs_18cat_full_real = r(mean)

** show distribution of effects


preserve 

	clear
	set obs `=n_rand'
	local j  = 1 
	gener cs_18cat_final= .
	gener cs_18cat_full_final = . 
	while `j'<=n_rand {
		
		replace cs_18cat_final= cs_18cat_final`j' if _n==`j'
		replace cs_18cat_full_final= cs_18cat_full_final`j' if _n==`j'
		
		local j = `j'+1
	}
	
	
	* note "search_cost_change" is a negative value 
	gener search_cost_change = ( (cs_18cat_final_real_post - cs_18cat_full_real ) - (cs_18cat_final - cs_18cat_full_final ))/-b_price
	gener welfare_change_full = (cs_18cat_full_real - cs_18cat_full_final)/-b_price
	gener welfare_change = (cs_18cat_final_real_post - cs_18cat_final)/-b_price
	gener welfare_change_gross= welfare_change - search_cost_change	
	
	** CREATES TABLE 6 **
	
	quietly sum search_cost_change, detail
	scalar cs_entry_search = round(r(mean),0.001)
	display r(mean)
	
	quietly sum welfare_change
	scalar cs_welfare_net = round(r(mean),0.001)
	display r(mean)

	quietly sum welfare_change_gross
	scalar cs_welfare_gross = round(r(mean),0.001)
	display r(mean)
	
	local eu3_eu2 = cs_welfare_gross
	local eu1_eu3 = cs_entry_search
	local eu1_eu2 = cs_welfare_net

	file open myfile using "$P_Tables/Table_6.tex", write replace
	file write myfile "1) Mean Gross Entry Effect & $ EU_3 - EU_2$ & `eu3_eu2'  \\" _n
	file write myfile " & &  \\" _n 
	file write myfile "2) Mean Entry Congestion Effect & $ EU_1 - EU_3$ &`eu1_eu3' \\  \hline" _n
	file write myfile " & & \\" _n
	file write myfile "3) Net Entry Effect & $ EU_1 - EU_2$ & `eu1_eu2' \\ \hline" _n

	file close myfile 	
		
	
restore 
