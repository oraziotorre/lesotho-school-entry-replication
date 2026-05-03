** MASTER FILE

*Packages to install: 

capture ssc install ftools, replace
capture ftools, compile

capture ssc install gtools, replace
capture ssc install reghdfe, replace
capture ssc install ivreghdfe, replace
capture ssc install egenmore, replace

capture ssc install outreg2, replace
capture ssc install sutex2, replace
capture ssc install estout, replace 

capture ssc install parmest, replace 

** DEFINE DIRECTORIES
* main directory

global P_Main "PATH_TO_CURRENT_FOLDER"
* e.g., "/home/ubuntu/replication_package/"
cd "$P_Main"

* where monthly data is
global P_Monthly_Data "$P_Main/monthly_app_data_csv"
* where weekly data is (games)
global P_Weekly_Data_Games "$P_Main/weekly_app_data_games"
* where weekly data is (non-games)
global P_Weekly_Data_NonGames "$P_Main/weekly_app_data_nongames"
* where ranking data is (games)
global P_Ranking_Data_Games "$P_Main/ranking_data_games"
* where ranking data is (non-games)
global P_Ranking_Data_NonGames "$P_Main/ranking_data_nongames"


* where all the processed data goes
global P_Data_Processed "$P_Main/processed"
* where output figures go
global P_Figures "$P_Main/figures"
* where output tables go
global P_Tables "$P_Main/tables"


*** CREATING MAIN DATA ***

* generating monthly datasets (combined games and non-games)
* testing to see if restricted raw csv data is available. 
* if this data is available, then proceed with data creation
capture confirm file "$P_Main/monthly_app_data_csv/monthlydata_2012_02_26.csv" 
if _rc == 0 {
	* cleans related apps list (prep for second file)
	do "$P_Main/stata_1_related_apps_list.do"
	* creates main monthly dataset with some supporting data
	do "$P_Main/stata_2_monthly_app_data_creation.do"
	* creates monthly data on n screenshots and n videos 
	do "$P_Main/stata_3a_n_photos_videos.do"
	* creates monthly data on app ratings 
	do "$P_Main/stata_3b_app_ratings.do"
	* creates monthly data on app size 
	do "$P_Main/stata_3c_app_sizes.do"
	* creates data of ML predicted categories (for games that exited pre Mar 2014)
	do "$P_Main/stata_4_reclassifying_game_cats.do"

	* generating weekly datasets (for games and non-games)
	do "$P_Main/stata_5_weekly_data_creation.do"
	* generating weekly ranking datasets (separately for games and non-games)
	do "$P_Main/stata_6a_ranking_data_creation_games.do"
	do "$P_Main/stata_6b_ranking_data_creation_nongames.do"


	* generating predicted monthly downloads for games (using weekly data + ranking data)
	** creates Figure B1,  row 1 of Table B2, first two columns of Table B3
	do "$P_Main/stata_7a_predicting_downloads_games.do"
	* generating predicted monthly downloads for non-games 
	** creates Table B1, row 2 of Table B2, last column of Table B3 
	do "$P_Main/stata_7b_predicting_downloads_nongames.do"

	* preparing monthly data for RF analysis 
	do "$P_Main/stata_8_preparing_RF_data.do"
}
*** DATA ANALYSIS ***

** MAIN TEXT 

* reduced form 
** creates Table 3 (congestion evidence) and Table 5 (entry evidence)
do "$P_Main/stata_9_RF_regressions_main_text.do"

* model-based 
** creates Table 4 and Table 6
do "$P_Main/stata_10_model_main_text.do"

* creates summary stats (Table 2)
do "$P_Main/stata_11_summary_stats.do"

** ONLINE APPENDIX 

* reduced form - alternative specifications, alternative outcomes, timing tests
** creates Appendix Tables B4, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11
** and Appendix Figures C1, C2, C3, and C4
do "$P_Main/stata_12_RF_regressions_appendix.do"

* google trends results (Appendix C.9)
** creates Appendix Figure C5
do "$P_Main/stata_13_google_trends.do"

* analysis of switching developers (Appendix C.10)
** creates Appendix Figure C6
do "$P_Main/stata_14_developer_switching_analysis.do"

* model-based appendix results - alternative specifications (i.e., nonlinear search model), additional coefficient estimates for main model
* and figures showing distributions of counterfactual simulations
** creates Appendix Tables D1, D2, and D3
** creates Appendix Figures D1, D2, and D3
do "$P_Main/stata_15_model_appendix.do"

