cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets"
clear all

use masterdataset

* To create HHI categories
gen hhi_flag = 0 if PostmergerHHI>=0 & PostmergerHHI<=1500
replace hhi_flag = 1 if PostmergerHHI>1500 & PostmergerHHI<=2500
replace hhi_flag = 2 if PostmergerHHI>2500 & PostmergerHHI<=5000
replace hhi_flag = 3 if PostmergerHHI>5000 & PostmergerHHI<=10000

* To create HHI change categories
gen hhichange_flag = 0 if HHIIncrease==0
replace hhichange_flag = 1 if HHIIncrease>0 & HHIIncrease<=100
replace hhichange_flag = 2 if HHIIncrease>100 & HHIIncrease<=200
replace hhichange_flag = 3 if HHIIncrease>200 & HHIIncrease<=9999

* To create .png maps

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/HHI Maps/PNG"

maptile hhi_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("HHI Concentration Category", size(vsmall)) lab( 2 "Low (0-1500)") lab(3 "Moderate (1500-2500)") lab(4 "High (2500-5000)") lab(5 "Very High (5000-10000)") size(vsmall))) cutv(0.5 1.5 2.5)
graph export hhipostmap.png, replace

* To map concentration changes by CZ
maptile hhichange_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("HHI Concentration Change Category", size(vsmall)) lab( 2 "None (0)") lab( 3 "Small (0-100)") lab(4 "Moderate (100-200)") lab(5 "High (200+)") size(vsmall))) cutv(0.5 1.5 2.5)
graph export hhichangemap.png, replace



* To create .gph maps

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Figures/HHI Maps/GPH"

* To map concentration levels by CZ
maptile hhi_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("HHI Concentration Category", size(vsmall)) lab( 2 "Low (0-1500)") lab(3 "Moderate (1500-2500)") lab(4 "High (2500-5000)") lab(5 "Very High (5000-10000)") size(vsmall))) cutv(0.5 1.5 2.5)
graph save hhipostmap.gph, replace

* To map concentration changes by CZ
maptile hhichange_flag, geo(cz2000) fcolor(midgreen yellow orange red) twopt(legend(title("HHI Concentration Change Category", size(vsmall)) lab( 2 "None (0)") lab( 3 "Small (0-100)") lab(4 "Moderate (100-200)") lab(5 "High (200+)") size(vsmall))) cutv(0.5 1.5 2.5)
graph save hhichangemap.gph, replace
