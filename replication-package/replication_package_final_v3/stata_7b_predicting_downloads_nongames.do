set more off


cd "$P_Data_Processed"

** Generating Table B1
clear 
use "/$P_Data_Processed/weekly_nongames_data.dta"
keep min_download max_download
drop if min_download==0
by min_download, sort: keep if _n==1
label variable min_download "Lower Bound"
label variable max_download "Upper Bound"

texsave min_download max_download using  "$P_Tables/Table_B1", varlabels frag replace

** 

clear
use weekly_nongames_data.dta

gegen cat_id = group(category)
drop category

drop if missing(cat_id)

fsort name date

by name date: keep if _n==1
by name: gener first_date = date[1]

merge m:1 name_id using "$P_Data_Processed/google.dta"
keep if _merge==3
drop if google==1
drop _merge
drop google

merge 1:1 name date using "$P_Data_Processed/android_toprankings_nongames_weekly.dta"
drop if _merge==2
drop _merge

capture drop category 
capture drop rank_category

gener month = month(date)
gener year = year(date)


set more off
merge m:1 name year month using "$P_Data_Processed/name_paid.dta"
keep if _merge==3
drop _merge

gener monthly_date = ym(year,month)

drop month year

gener l_min_download = ln(min_download)


drop if date== 18998

** Second row of Table B2 (summary stats)
cd "$P_Tables"
label variable min_download "Non-Games Download Lower Bound"
sutex2 min_download if rank<=500 & date==first_date, varlabels min append saving("Table_B2") 

drop min_download
drop max_download



gener neg_min_download = -l_min_download
gener neg_first_date = -first_date
fsort date cat_id paid rank neg_min_download neg_first_date

set seed 123456789
by date cat_id paid rank neg_min_download neg_first_date: gener rand_num = runiform()

fsort date cat_id paid rank neg_min_download neg_first_date rand_num

drop rand_num

by date cat_id paid: gener rank_pred = rank
by date cat_id paid: replace rank_pred = rank_pred[_n-1]+1 if missing(rank_pred)

drop rank

gener l_rank_pred = ln(rank_pred)

drop neg_min_download neg_first_date


gener year_2013 = (year==2013)
gener year_2014 = (year==2014)

gener year_2013_paid = year_2013*paid
gener year_2014_paid = year_2014*paid 


gener l_rank_pred_paid = l_rank_pred*paid
gener l_rank_pred_nonpaid = l_rank_pred*(1-paid)

label variable l_rank_pred_nonpaid "ln(Rank)" 
label variable l_rank_pred_paid "ln(Rank) $\times$ Paid" 

** Last column of Table B3

reghdfe l_min_download l_rank_pred_nonpaid l_rank_pred_paid i.cat_id i.cat_id#paid i.month i.month#paid year_2013 year_2013_paid  if date==first_date & rank_pred<=500, absorb(year_2014 year_2014_paid cat_id#year_2014 cat_id#paid#year_2014) cluster(cat_id#paid)
outreg2 using "$P_Tables/Table_B3", dec(3) tex(frag) nonotes noaster nocons label keep(l_rank_pred_nonpaid l_rank_pred_paid) append 


capture drop down_pred
predict down_pred
replace down_pred = exp(down_pred)


****
gegen monthly_pred_downloads = total(down_pred), by(name monthly_date)


gcollapse monthly_pred_downloads rank_pred, by(name monthly_date)

rename monthly_date date 

save "$P_Data_Processed/monthly_downloads_nongames.dta", replace
