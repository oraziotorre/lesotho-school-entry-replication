infix using "C:\COUNTRIES\LS72\LSAR72FL.dct"

label variable hivclust "Cluster"
label variable hivnumb  "Household"
label variable hivline  "Line"
label variable hiv01    "Bar code"
label variable hiv02    "Lab number"
label variable hiv03    "Blood test result"
label variable hiv05    "Sample weight"
label variable slagodn  "LAg normalized OD (3 decimals)"
label variable sviral   "Viral load"
label variable sprelim  "Preliminary recent status"
label variable srecent  "Final recent status"

#delimit ;
label define HIV03   
     0 "HIV negative"
     1 "HIV  positive"
     2 "HIV2 positive"
     3 "HIV1 & HIV2 positive"
     4 "ERROR : V-, W+, M+"
     5 "ERROR : V-, W+, M-"
     6 "ERROR : V-, W-, M+"
     7 "Indeterminant"
;
label define SVIRAL  
999991 "Target not detected"
999992 "Viral load less than 550 c/mL"
999993 "Technical error"
999994 "Insufficient specimen volume"
;
label define SPRELIM 
     1 "Preliminary recent"
     2 "Long term"
     3 "HIV negative"
;
label define SRECENT 
     1 "Recent"
     2 "Long term"
     3 "HIV negative"
     7 "HIV Indeterminant"
     9 "Recency missing"
;

#delimit cr
label values hiv03    HIV03   
label values sviral   SVIRAL  
label values sprelim  SPRELIM 
label values srecent  SRECENT 
