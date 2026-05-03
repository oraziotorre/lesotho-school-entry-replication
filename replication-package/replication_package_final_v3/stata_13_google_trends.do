** ANDROID GAME / NON-GAME TRENDS **
clear
 insheet using  "$P_Main/google_trends/AndroidGamesApps_SearchTrends.csv", comma clear
 drop if _n<3
 rename v1 date
rename v2 android_game_trends
destring android_game_trends, replace force
rename v3 android_non_game_trends
destring android_non_game_trends, replace force
gener game_non_game_ratio = android_game_trends/android_non_game_trends
gener date2 = date(date, "YMD")
drop date
rename date2 date
format date %td

tw (line android_game_trends date) (line android_non_game_trends date), tline(16mar2014) tline(08dec2013,  lpattern(dash)) legend(label(1 "Android Games") label(2 "Android Apps") pos(6) col(2))
gr export "$P_Figures/Figure_C5a.png", replace

tw (line game_non_game_ratio date), tline(16mar2014) tline(08dec2013,  lpattern(dash)) ytitle("Android Games/ Android Apps")
gr export "$P_Figures/Figure_C5b.png", replace

clear
 insheet using  "$P_Main/google_trends/GooglePlayGamesApps_SearchTrends.csv", comma clear
  drop if _n<3
rename v1 date
rename v2 android_game_trends
destring android_game_trends, replace force
rename v3 android_non_game_trends
replace android_non_game_trends = "1" if android_non_game_trends=="<1"
destring android_non_game_trends, replace force

gener game_non_game_ratio = android_game_trends/android_non_game_trends
gener date2 = date(date, "YMD")
drop date
rename date2 date
format date %td

tw (line android_game_trends date) (line android_non_game_trends date), tline(16mar2014) tline(08dec2013,  lpattern(dash)) legend(label(1 "Google Play Games") label(2 "Google Play Apps") col(2) pos(6))
gr export "$P_Figures/Figure_C5c.png", replace

tw (line game_non_game_ratio date if date>19056), tline(16mar2014) tline(08dec2013,  lpattern(dash)) ytitle("Google Play Games/Google Play Apps")
gr export "$P_Figures/Figure_C5d.png", replace


clear
 insheet using  "$P_Main/google_trends/GooglePlayGames_iOS_Games_SearchTrends.csv", comma clear
  drop if _n<3
rename v1 date
rename v2 android_game_trends
destring android_game_trends, replace force

rename v3 ios_game_trends
destring ios_game_trends, replace force

gener android_ios_ratio = android_game_trends/ios_game_trends
gener date2 = date(date, "YMD")
drop date
rename date2 date
format date %td

tw (line android_game_trends date) (line ios_game_trends date), tline(16mar2014) tline(08dec2013,  lpattern(dash)) legend(label(1 "Google Play Games") label(2 "iOS Games") col(2) pos(6))
gr export "$P_Figures/Figure_C5e.png", replace

tw (line android_ios_ratio date if date>19056), tline(16mar2014) tline(08dec2013,  lpattern(dash))ytitle("Google Play Games/iOS Games")
gr export "$P_Figures/Figure_C5f.png", replace

