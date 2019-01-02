
*** To calculate the change in wages from Azar Table 2 Panel A Column 3
use "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/masterdataset.dta", clear

gen coeff = -0.0378

gen rightside = ln(PostmergerHHI/HHI) * coeff
gen newwage_over_oldwage = exp(rightside)
gen wagechange = (1-newwage_over_oldwage)*(weighted_wages)

* To create HHI categories
gen wage_flag = 0 if wagechange==0
replace wage_flag = 1 if wagechange>0 & wagechange<=5
replace wage_flag = 2 if wagechange>5 & wagechange<=10
replace wage_flag = 3 if wagechange>10 & wagechange <= 9999999

* To map wage changes by CZ
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Wage Maps/PNG"

maptile wage_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("Wage Decline Bins", size(vsmall)) lab( 2 "None (0)") lab(3 "Low (-$0.00-$5.00)") lab(4 "High (-$5.00-10.00)") lab(5 "Very High (-$10.00+)") size(vsmall))) cutv(0.5 1.5 2.5)
graph export azar3wagemap.png, replace

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Wage Maps/GPH"

maptile wage_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("Wage Decline Bins", size(vsmall)) lab( 2 "None (0)") lab(3 "Low (-$0.00-$5.00)") lab(4 "High (-$5.00-10.00)") lab(5 "Very High (-$10.00+)") size(vsmall))) cutv(0.5 1.5 2.5)
graph save azar3wagemap.gph, replace

*** To create a scatterplot of wage changes

* To seleect which observations to label.
sort HHIIncrease

generate label = "Miami, FL" if  cz == 410
replace label = "Detroit, MI" if cz == 232
replace label = "Pittsburgh, PA" if cz == 203
replace label = "Milwaukee, WI" if cz == 70
replace label = "Charleston, SC" if cz == 98
replace label = "Twin Falls, ID" if cz == 124
replace label = "Baltimore, MD" if cz == 36
replace label = "Pinehurst, NC" if cz ==528
replace label = "Anchorage, AL" if cz == 103
replace label = "Lafayette, LA" if cz == 168

gen wageloss = -wagechange

* To create the scatterplots
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Scatterplots/PNG"

twoway (scatter wageloss HHIIncrease,  mcolor(eltgreen) msize(tiny) msymbol(circle) mlabel(label) mlabcolor(dkgreen)), ytitle(Change in Weekly Wages) ylabel(0 "0" -10 "-$10" -20 "-$20" -30 "-$30" -40 "-$40"-50 "-$50") 
graph export azar3hwagescatter.png, replace

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Scatterplots/GPH"

twoway (scatter wageloss HHIIncrease,  mcolor(eltgreen) msize(tiny) msymbol(circle) mlabel(label) mlabcolor(dkgreen)), ytitle(Change in Weekly Wages) ylabel(0 "0" -10 "-$10" -20 "-$20" -30 "-$30" -40 "-$40"-50 "-$50") 
graph save azar3hwagescatter.gph, replace












*** To calculate the change in wages from Azar Table 2 Panel A Column 6
use "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/masterdataset.dta", clear

gen coeff = -0.127

gen rightside = ln(PostmergerHHI/HHI) * coeff
gen newwage_over_oldwage = exp(rightside)
gen wagechange = (1-newwage_over_oldwage)*(weighted_wages)

* To create HHI categories
gen wage_flag = 0 if wagechange==0
replace wage_flag = 1 if wagechange>0 & wagechange<=5
replace wage_flag = 2 if wagechange>5 & wagechange<=10
replace wage_flag = 3 if wagechange>10 & wagechange <= 9999999

* To map wage changes by CZ
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Wage Maps/PNG"

maptile wage_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("Wage Decline Bins", size(vsmall)) lab( 2 "None (0)") lab(3 "Low (-$0.00-$5.00)") lab(4 "High (-$5.00-10.00)") lab(5 "Very High (-$10.00+)") size(vsmall))) cutv(0.5 1.5 2.5)
graph export azar6wagemap.png, replace

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Wage Maps/GPH"

maptile wage_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("Wage Decline Bins", size(vsmall)) lab( 2 "None (0)") lab(3 "Low (-$0.00-$5.00)") lab(4 "High (-$5.00-10.00)") lab(5 "Very High (-$10.00+)") size(vsmall))) cutv(0.5 1.5 2.5)
graph save azar6wagemap.gph, replace

*** To create a scatterplot of wage changes

* To seleect which observations to label.
sort HHIIncrease

generate label = "Miami, FL" if  cz == 410
replace label = "Detroit, MI" if cz == 232
replace label = "Pittsburgh, PA" if cz == 203
replace label = "Milwaukee, WI" if cz == 70
replace label = "Charleston, SC" if cz == 98
replace label = "Twin Falls, ID" if cz == 124
replace label = "Baltimore, MD" if cz == 36
replace label = "Pinehurst, NC" if cz ==528
replace label = "Anchorage, AL" if cz == 103
replace label = "Lafayette, LA" if cz == 168

gen wageloss = -wagechange


* To create the scatterplots
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Scatterplots/PNG"

twoway (scatter wageloss HHIIncrease,  mcolor(eltgreen) msize(tiny) msymbol(circle) mlabel(label) mlabcolor(dkgreen)), ytitle(Change in Weekly Wages) ylabel(0 "0" -40 "-$40" -80 "-$80" -120 "-$120" -160 "-$160"-200 "-$200") 
graph export azar6hwagescatter.png, replace

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Scatterplots/GPH"

twoway (scatter wageloss HHIIncrease,  mcolor(eltgreen) msize(tiny) msymbol(circle) mlabel(label) mlabcolor(dkgreen)), ytitle(Change in Weekly Wages) ylabel(0 "0" -40 "-$40" -80 "-$80" -120 "-$120" -160 "-$160"-200 "-$200") 
graph save azar6hwagescatter.gph, replace












*** To calculate the change in wages from Benmelech Table 2 Panel B Column 3
use "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/masterdataset.dta", clear

gen coeff = -0.054

gen rightside = (PostmergerHHI-HHI)/10000 * coeff
gen newwage_over_oldwage = exp(rightside)
gen wagechange = (1-newwage_over_oldwage)*(weighted_wages)

* To create HHI categories
gen wage_flag = 0 if wagechange==0
replace wage_flag = 1 if wagechange>0 & wagechange<=5
replace wage_flag = 2 if wagechange>5 & wagechange<=10
replace wage_flag = 3 if wagechange>10 & wagechange <= 9999999

* To map wage changes by CZ
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Wage Maps/PNG"

maptile wage_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("Wage Decline Bins", size(vsmall)) lab( 2 "None (0)") lab(3 "Low (-$0.00-$5.00)") lab(4 "High (-$5.00-10.00)") lab(5 "Very High (-$10.00+)") size(vsmall))) cutv(0.5 1.5 2.5)
graph export benmelechwagemap.png, replace

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Wage Maps/GPH"

maptile wage_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("Wage Decline Bins", size(vsmall)) lab( 2 "None (0)") lab(3 "Low (-$0.00-$5.00)") lab(4 "High (-$5.00-10.00)") lab(5 "Very High (-$10.00+)") size(vsmall))) cutv(0.5 1.5 2.5)
graph save benmelechwagemap.gph, replace

*** To create a scatterplot of wage changes

* To seleect which observations to label.
sort HHIIncrease

generate label = "Miami, FL" if  cz == 410
replace label = "Detroit, MI" if cz == 232
replace label = "Pittsburgh, PA" if cz == 203
replace label = "Milwaukee, WI" if cz == 70
replace label = "Charleston, SC" if cz == 98
replace label = "Twin Falls, ID" if cz == 124
replace label = "Baltimore, MD" if cz == 36
replace label = "Pinehurst, NC" if cz ==528
replace label = "Anchorage, AL" if cz == 103
replace label = "Lafayette, LA" if cz == 168

gen wageloss = -wagechange


* To create the scatterplots
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Scatterplots/PNG"

twoway (scatter wageloss HHIIncrease,  mcolor(eltgreen) msize(tiny) msymbol(circle) mlabel(label) mlabcolor(dkgreen)), ytitle(Change in Weekly Wages) ylabel(0 "0" -5 "-$5" -10 "-$10" -15 "-$15" -20 "-$20"-25 "-$25") 
graph export benmelechwagescatter.png, replace

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Scatterplots/GPH"

twoway (scatter wageloss HHIIncrease,  mcolor(eltgreen) msize(tiny) msymbol(circle) mlabel(label) mlabcolor(dkgreen)), ytitle(Change in Weekly Wages) ylabel(0 "0" -5 "-$5" -10 "-$10" -15 "-$15" -20 "-$20"-25 "-$25") 
graph save benmelechwagescatter.gph, replace










*** To calculate the change in wages from Rinz Table 6 Column 4
use "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/masterdataset.dta", clear

gen coeff = -0.0324

gen rightside = ln(PostmergerHHI/HHI) * coeff
gen newwage_over_oldwage = exp(rightside)
gen wagechange = (1-newwage_over_oldwage)*(weighted_wages)

* To create HHI categories
gen wage_flag = 0 if wagechange==0
replace wage_flag = 1 if wagechange>0 & wagechange<=5
replace wage_flag = 2 if wagechange>5 & wagechange<=10
replace wage_flag = 3 if wagechange>10 & wagechange <= 9999999

* To map wage changes by CZ
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Wage Maps/PNG"

maptile wage_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("Wage Decline Bins", size(vsmall)) lab( 2 "None (0)") lab(3 "Low (-$0.00-$5.00)") lab(4 "High (-$5.00-10.00)") lab(5 "Very High (-$10.00+)") size(vsmall))) cutv(0.5 1.5 2.5)
graph export rinzwagemap.png, replace

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Wage Maps/GPH"

maptile wage_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("Wage Decline Bins", size(vsmall)) lab( 2 "None (0)") lab(3 "Low (-$0.00-$5.00)") lab(4 "High (-$5.00-10.00)") lab(5 "Very High (-$10.00+)") size(vsmall))) cutv(0.5 1.5 2.5)
graph save rinzwagemap.gph, replace

*** To create a scatterplot of wage changes

* To seleect which observations to label.
sort HHIIncrease

generate label = "Miami, FL" if  cz == 410
replace label = "Detroit, MI" if cz == 232
replace label = "Pittsburgh, PA" if cz == 203
replace label = "Milwaukee, WI" if cz == 70
replace label = "Charleston, SC" if cz == 98
replace label = "Twin Falls, ID" if cz == 124
replace label = "Baltimore, MD" if cz == 36
replace label = "Pinehurst, NC" if cz ==528
replace label = "Anchorage, AL" if cz == 103
replace label = "Lafayette, LA" if cz == 168

gen wageloss = -wagechange

* To create the scatterplots
cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Scatterplots/PNG"

twoway (scatter wageloss HHIIncrease,  mcolor(eltgreen) msize(tiny) msymbol(circle) mlabel(label) mlabcolor(dkgreen)), ytitle(Change in Weekly Wages) ylabel(0 "0" -10 "-$10" -20 "-$20" -30 "-$30" -40 "-$40") 
graph export rinzwagescatter.png, replace

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/Scatterplots/GPH"

twoway (scatter wageloss HHIIncrease,  mcolor(eltgreen) msize(tiny) msymbol(circle) mlabel(label) mlabcolor(dkgreen)), ytitle(Change in Weekly Wages) ylabel(0 "0" -10 "-$10" -20 "-$20" -30 "-$30" -40 "-$40")
graph save rinzwagemap.gph, replace
