set more off

cd "$P_Data_Processed"

** Generating Figure B1
clear 

use "/$P_Data_Processed/android_toprankings_games_weekly.dta"
sort name_id date
by name_id: gener rank_diff = rank- rank[_n-1]
histogram rank_diff, xtitle("Week (t) Rank - Week (t-1) Rank")
save "$P_Figures/Figure_B1.png", replace 
** 

clear
use weekly_games_data.dta
sort name date
by name: egen first_date=  min(date)

by name date: keep if _n==1

merge 1:1 name date using "$P_Data_Processed/android_toprankings_games_weekly.dta"
drop if _merge==2
drop _merge

capture drop month
gener month = month(date)
capture drop year
gener year = year(date)

merge m:1 name year month using "$P_Data_Processed/name_paid.dta"
keep if _merge==3
drop _merge

sort name date
capture drop first_date
by name: egen first_date =min(date)

gener orig_rank = rank

by name: gener next_min_download = min_download[_n+1]
by name: replace next_min_download = min_download if _n==_N


gener l_min_download = ln(min_download)

gener l_rank = ln(rank)

gener predicted_sales = 0

drop if date== 18998


gener monthly_date = ym(year,month)


gener neg_min_download = -min_download
gener neg_first_date = -first_date
sort date category paid rank neg_min_download neg_first_date

set seed 123456789
by date category paid rank neg_min_download neg_first_date: gener rand_num = runiform()

sort date category paid rank neg_min_download neg_first_date rand_num

drop rand_num

by date category paid: gener rank_pred = rank
by date category paid: replace rank_pred = rank_pred[_n-1]+1 if missing(rank_pred)

gener l_rank_pred = ln(rank_pred)

drop neg_min_download neg_first_date

gegen cat_id = group(category)

gener post = (monthly_date>=650)


gener year_2013 = (year==2013)
gener year_2014 = (year==2014)

gener year_2013_paid = year_2013*paid
gener year_2014_paid = year_2014*paid 

gener l_rank_pred_paid = l_rank_pred*paid
gener l_rank_pred_nonpaid = l_rank_pred*(1-paid)

label variable l_rank_pred_nonpaid "ln(Rank)" 
label variable l_rank_pred_paid "ln(Rank) $\times$ Paid" 

** First row of Table B2 (summary stats)
cd "$P_Tables"
label variable min_download "Games Download Lower Bound"
sutex2 min_download if rank_pred<=500 & date==first_date, varlabels min replace saving("Table_B2") 

** First two columns of Table B3

reghdfe l_min_download l_rank_pred_nonpaid l_rank_pred_paid i.cat_id i.cat_id#paid i.month i.month#paid year_2013 year_2013_paid  if date==first_date & rank_pred<=500, absorb(year_2014 year_2014_paid cat_id#year_2014 cat_id#paid#year_2014) cluster(cat_id#paid)
outreg2 using "$P_Tables/Table_B3", dec(3) tex(frag) nocons nonotes noaster label keep(l_rank_pred_nonpaid l_rank_pred_paid) replace

gener rank_over50 = (rank_pred>50)
gener l_rank_pred_nonpaid_low = l_rank_pred_nonpaid*(1-rank_over50)
gener l_rank_pred_paid_low = l_rank_pred_paid*(1-rank_over50)

label variable l_rank_pred_nonpaid_low "ln(Rank) $\times$ Low-Ranked"
label variable l_rank_pred_paid_low "ln(Rank) $\times$ Paid $\times$ Low-Ranked"

reghdfe l_min_download l_rank_pred_nonpaid l_rank_pred_paid l_rank_pred_nonpaid_low l_rank_pred_paid_low i.cat_id i.cat_id#paid i.month i.month#paid year_2013 year_2013_paid  if date==first_date & rank_pred<=500, absorb(year_2014 year_2014_paid cat_id#year_2014 cat_id#paid#year_2014) cluster(cat_id#paid)
outreg2 using "$P_Tables/Table_B3", dec(3) tex(frag) keep(l_rank_pred_nonpaid l_rank_pred_paid l_rank_pred_nonpaid_low l_rank_pred_paid_low) nonotes nocons noaster label append 


capture drop down_pred
predict down_pred
replace down_pred = exp(down_pred)



****
gegen monthly_pred_downloads = total(down_pred), by(name monthly_date)

gcollapse monthly_pred_downloads rank_pred, by(name monthly_date)

rename monthly_date date 

save "$P_Data_Processed/monthly_downloads_games.dta", replace







