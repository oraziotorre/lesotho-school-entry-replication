** DEVELOPERS TEST 

* This file checks the ratio of N developers who switch from non-games to games
* over N developers who switch from games to non-games 
* and creates Figure C6

** FIRST CREATE DEVELOPER-LEVEL DATA 
clear 


use "$P_Data_Processed/monthly_app_data.dta"

hashsort name date
gegen first_date = min(date), by(name)
gener new_app = 1 if date==first_date
replace new_app = 0 if missing(new_app)
replace new_app =0 if date==624

gener new_game = new_app*game 

* creating number of new games and non-games by developer id
gener this_is_an_app = 1 
gegen dev_n_apps = total(this_is_an_app), by(dev_id date)
gegen dev_n_new_apps = total(new_app), by(dev_id date)
gegen dev_n_new_games = total(new_game), by(dev_id date)

hashsort dev_id date name 
by dev_id date: keep if _n==1

** you are a game developer if you developed a game in the last period
 
by dev_id: gener game_dev = 1 if dev_n_new_games[_n-1]>0 & _n>1
by dev_id: replace game_dev = 1 if game_dev[_n-1]==1 & _n>1
by dev_id: replace game_dev = 0 if missing(game_dev) & _n>1

gener dev_n_new_nongames = dev_n_new_apps - dev_n_new_games
by dev_id: gener non_game_dev =1 if dev_n_new_nongames[_n-1]>0 & _n>1
by dev_id: replace non_game_dev = 1 if non_game_dev[_n-1]==1 & _n>1
by dev_id: replace non_game_dev = 0 if missing(non_game_dev) & _n>1

gener both_dev = 1 if game_dev==1 & non_game_dev==1
replace both_dev =0 if missing(both_dev)
by dev_id: replace both_dev = . if _n==1

gener only_game_dev =1 if  game_dev==1 & non_game_dev==0
replace only_game_dev = 0 if missing(only_game_dev)
by dev_id: replace only_game_dev = . if _n==1

gener only_non_game_dev = 1 if game_dev==0 & non_game_dev==1
replace only_non_game_dev = 0 if missing(only_non_game_dev)
by dev_id: replace only_non_game_dev = . if _n==1



gener nongame_game_switcher = (only_non_game_dev==1 & dev_n_new_games>0)
by dev_id: replace nongame_game_switcher = . if _n==1
gener game_nongame_switcher = (only_game_dev==1 & dev_n_new_nongames>0)
by dev_id: replace game_nongame_switcher = . if _n==1


by date, sort: egen n_nongame_game_switchers = total(nongame_game_switcher)
by date: egen n_game_nongame_switchers = total(game_nongame_switcher)
by date: gener use_date= 1 if _n==1

gener ratio_game_nongame_switchers = n_nongame_game_switchers/n_game_nongame_switchers 
format date %tm

tw (line ratio_game_nongame_switchers date if use_date==1 & date>624),  ytitle("") tline(2014m2) tline(2013m11, lpattern(dash)) xtitle("Date")
gr export "$P_Figures/Figure_C6.png", replace
