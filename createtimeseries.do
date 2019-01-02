cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets"

use cesdataset, clear

*** To make relevant time series data for Employment and Wages

* As a .png
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Time Series/PNG"

twoway (line weekly_earnings date) (line hourly_earnings date, yaxis(2)), legend(lab(1 "Weekly Earnings") lab(2 "Hourly Earnings")) caption(NAICS 443142 - Electronic Stores)
graph export earnings.png, replace

twoway (line adj_weekly_earnings date) (line adj_hourly_earnings date, yaxis(2)), ylabel(500 "$500" 600 "$600" 700 "$700" 800 "$800" 900 "$900" 1000 "$1000") ylabel(16 "$16" 18 "$18" 20 "$20" 22 "$22" 24 "$24" 26 "$26", axis(2)) legend(lab(1 "Real Weekly Earnings") lab(2 "Real Hourly Earnings")) caption(NAICS 443142 - Electronic Stores)
graph export adjusted_earnings.png, replace

twoway (line employment date), ylabel(0 "0" 100 "100" 200 "200" 300 "300" 400 "400" 500 "500") caption(NAICS 443142 - Electronic Stores)
graph export employment.png, replace

* As a .gph
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Time Series/GPH"
twoway (line weekly_earnings date) (line hourly_earnings date, yaxis(2)), legend(lab(1 "Weekly Earnings") lab(2 "Hourly Earnings")) caption(NAICS 443142 - Electronic Stores)
graph save earnings.gph, replace

twoway (line adj_weekly_earnings date) (line adj_hourly_earnings date, yaxis(2)), ylabel(500 "$500" 600 "$600" 700 "$700" 800 "$800" 900 "$900" 1000 "$1000") ylabel(16 "$16" 18 "$18" 20 "$20" 22 "$22" 24 "$24" 26 "$26", axis(2)) legend(lab(1 "Real Weekly Earnings") lab(2 "Real Hourly Earnings")) caption(NAICS 443142 - Electronic Stores)
graph save adjusted_earnings.gph, replace

twoway (line employment date), ylabel(0 "0" 100 "100" 200 "200" 300 "300" 400 "400" 500 "500") caption(NAICS 443142 - Electronic Stores)
graph save employment.gph, replace


*** Now to create indexed series

* To index from 1990
gen indexweekly = (1+((weekly_earnings - 266.22)/266.22)) * 100
gen indexhourly = (1+((hourly_earnings - 8.7)/8.7)) * 100
gen adjindexweekly = (1+((adj_weekly_earnings - 525.8544)/525.8544)) * 100
gen adjindexhourly = (1+((adj_hourly_earnings - 17.184786)/17.184786)) * 100
gen indexemployment = (1+((employment - 286.60001)/286.60001)) * 100


* To graph an Index of Average Franchise and Non-Franchise Monthly Earnings
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Time Series/PNG"

* As a .png
twoway (line indexweekly date) (line indexhourly date), title(Index of Weekly and Hourly Earnings) ///
ytitle(Index 1990 = 100) xtitle(Year) caption(NAICS 443142 - Electronic Stores) ///
legend(lab(1 "Weekly Earnings") lab(2 "Hourly Earnings"))
graph export indexedearnings.png, replace

twoway (line adjindexweekly date) (line adjindexhourly date), title(Index of Real Weekly and Hourly Earnings) ///
ytitle(Index 1990 = 100) xtitle(Year) caption(NAICS 443142 - Electronic Stores) ///
legend(lab(1 "Real Weekly Earnings") lab(2 "Real Hourly Earnings"))
graph export indexedrealearnings.png, replace

twoway (line indexemployment date), title(Index of Employment) ///
ytitle(Index 1990 = 100) xtitle(Year) caption(NAICS 443142 - Electronic Stores)
graph export indexedemployment.png, replace


* As a .gph
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Time Series/GPH"
twoway (line indexweekly date) (line indexhourly date), title(Index of Weekly and Hourly Earnings) ///
ytitle(Index 1990 = 100) xtitle(Year) caption(NAICS 443142 - Electronic Stores) ///
legend(lab(1 "Weekly Earnings") lab(2 "Hourly Earnings"))
graph save indexedearnings.gph, replace

twoway (line adjindexweekly date) (line adjindexhourly date), title(Index of Real Weekly and Hourly Earnings) ///
ytitle(Index 1990 = 100) xtitle(Year) caption(NAICS 443142 - Electronic Stores) ///
legend(lab(1 "Real Weekly Earnings") lab(2 "Real Hourly Earnings"))
graph save indexedrealearnings.gph, replace

twoway (line indexemployment date), title(Index of Employment) ///
ytitle(Index 1990 = 100) xtitle(Year) caption(NAICS 443142 - Electronic Stores)
graph save indexedemployment.gph, replace
