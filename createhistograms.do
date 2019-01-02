use "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/masterdataset.dta", clear

* To add coefficients from the papers
gen azar3 = -0.0378
gen azar6 = -0.127
gen benmelech = -0.054
gen rinz = -0.0324

* To calculate change in wages using the coefficients

gen azar3rightside = ln(PostmergerHHI/HHI) * azar3
gen azar3newwage_over_oldwage = exp(azar3rightside)
gen azar3percentchange = azar3newwage_over_oldwage - 1
gen azar3wagechange = -(1-azar3newwage_over_oldwage)*(weighted_wages)

gen azar6rightside = ln(PostmergerHHI/HHI) * azar6
gen azar6newwage_over_oldwage = exp(azar6rightside)
gen azar6percentchange = azar6newwage_over_oldwage - 1
gen azar6wagechange = -(1-azar6newwage_over_oldwage)*(weighted_wages)

gen benmelechrightside = ln(PostmergerHHI/HHI) * benmelech
gen benmelechnewwage_over_oldwage = exp(benmelechrightside)
gen benmelechpercentchange = benmelechnewwage_over_oldwage - 1
gen benmelechwagechange = -(1-benmelechnewwage_over_oldwage)*(weighted_wages)

gen rinzrightside = ln(PostmergerHHI/HHI) * rinz
gen rinznewwage_over_oldwage = exp(rinzrightside)
gen rinzpercentchange = rinznewwage_over_oldwage - 1
gen rinzwagechange = -(1-rinznewwage_over_oldwage)*(weighted_wages)


*** To create histograms of wage reductions using the coefficients from each paper

* To create .png
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Histograms/PNG"

histogram azar3percentchange, discrete frequency ytitle(Number of CZs) xtitle(Percent Change in Earnings from Merger) w(0.01) start(-0.1) xlabel(-.1 "10%" -.08 "-8%" -.06 "-6%" -.04 "-4%" -.02 "-2%" 0 "0%")
graph export azar3hist.png, replace

histogram azar6percentchange, discrete frequency ytitle(Number of CZs) xtitle(Percent Change in Earnings from Merger) w(0.01) start(-0.1) xlabel(-.1 "10%" -.08 "-8%" -.06 "-6%" -.04 "-4%" -.02 "-2%" 0 "0%")
graph export azar6hist.png, replace

histogram benmelechpercentchange, discrete frequency ytitle(Number of CZs) xtitle(Percent Change in Earnings from Merger) w(0.01) start(-0.1) xlabel(-.1 "10%" -.08 "-8%" -.06 "-6%" -.04 "-4%" -.02 "-2%" 0 "0%")
graph export benmelechhist.png, replace

histogram rinzpercentchange, discrete frequency ytitle(Number of CZs) xtitle(Percent Change in Earnings from Merger) w(0.01) start(-0.1) xlabel(-.1 "10%" -.08 "-8%" -.06 "-6%" -.04 "-4%" -.02 "-2%" 0 "0%")
graph export rinzhist.png, replace


* To create .gph
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Histograms/GPH"

histogram azar3percentchange, discrete frequency ytitle(Number of CZs) xtitle(Percent Change in Earnings from Merger) w(0.01) start(-0.1) xlabel(-.1 "10%" -.08 "-8%" -.06 "-6%" -.04 "-4%" -.02 "-2%" 0 "0%")
graph save azar3hist.gph, replace

histogram azar6percentchange, discrete frequency ytitle(Number of CZs) xtitle(Percent Change in Earnings from Merger) w(0.01) start(-0.1) xlabel(-.1 "10%" -.08 "-8%" -.06 "-6%" -.04 "-4%" -.02 "-2%" 0 "0%")
graph save azar6hist.gph, replace

histogram benmelechpercentchange, discrete frequency ytitle(Number of CZs) xtitle(Percent Change in Earnings from Merger) w(0.01) start(-0.1) xlabel(-.1 "10%" -.08 "-8%" -.06 "-6%" -.04 "-4%" -.02 "-2%" 0 "0%")
graph save benmelechhist.gph, replace

histogram rinzpercentchange, discrete frequency ytitle(Number of CZs) xtitle(Percent Change in Earnings from Merger) w(0.01) start(-0.1) xlabel(-.1 "10%" -.08 "-8%" -.06 "-6%" -.04 "-4%" -.02 "-2%" 0 "0%")
graph save rinzhist.gph, replace



*** To create a table listing the largest wage declines by area in descending order

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Top Decline"

sort azar3wagechange
gen Rank = _n

generate str CommutingZone = "Wenatchee, WA" in 1
replace CommutingZone = "Atlanta, GA" in 2
replace CommutingZone = "Austin, TX" in 3
replace CommutingZone = "Newark, NJ" in 4
replace CommutingZone = "Dallas, TX" in 5
replace CommutingZone = "Chicago, IL" in 6
replace CommutingZone = "Wichita Falls, TX" in 7
replace CommutingZone = "St. Louis, MO" in 8
replace CommutingZone = "Washington, DC" in 9
replace CommutingZone = "Kansas City, KS" in 10
 

keep Rank cz MSANAME CommutingZone azar3wagechange azar6wagechange benmelechwagechange rinzwagechange

label var azar3wagechange "Wage Change Using Azar Coefficient "
label var azar6wagechange "Wage Change Using Other Azar Coefficient"
label var benmelechwagechange "Wage Change Using Benmelech Coefficient"
label var rinzwagechange "Wage Change Using Rinz Coefficient"

export excel topdecline.xlsx, replace firstrow(varlabels)

joinby cz using "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/cz_pop.dta"

export excel toppopulationdecline.xlsx, replace firstrow(varlabels)

