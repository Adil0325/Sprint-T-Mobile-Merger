cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets"

* To create a FIPS to CZ crosswalk
import excel "/Users/aabdela/Downloads/fips_cz_crosswalk.xls", sheet("CZ00_Equiv") firstrow clear
rename CommutingZoneID2000 cz
keep cz FIPS
save crosswalk, replace


*** Create a cz to state crosswalk. I used the store data sheet from the excel file
* because each commuting zone hasa state variable.
import excel "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/Market Overlap Analysis_Commuter Zones_20181029.xlsx", sheet("Store Data") firstrow clear
keep CommuterZone state MSANAME
rename CommuterZone cz

* To drop repeated matches
by cz, sort: gen dup = cond(_N==0,1,_n)
drop if dup>1
drop dup

save cztostate, replace


* To create a dataset for state wages. This will be used to replace missing wage data for certain CZs
import delimited "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/qcew_earnings.csv", encoding(ISO-8859-1)clear
gen statecode = substr(area_fips,1,2)
by statecode, sort: gen dup = cond(_N==0,1,_n)
drop if dup>1
drop dup
destring statecode, force replace
rename avg_wkly_wage statewage
joinby statecode using statefip
keep statewage statename statecode state
save statewage, replace


**** Now to use the QCEW wage data.
import delimited "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/qcew_earnings.csv", encoding(ISO-8859-1)clear

* To create an average employment level
gen avgemp = (month1_emplvl + month2_emplvl + month3_emplvl) / 3

keep avgemp area_fips avg_wkly_wage

* Now to merge the crosswalk with the QCEW data.
rename area_fips FIPS
merge m:m FIPS using crosswalk
drop _merge


*I chose to do following below instead of the collapse command so we can keep all of the variables
* and their labels.
replace avg_wkly_wage =. if avg_wkly_wage==0
by cz, sort: egen weighted_wages = wtmean(avg_wkly_wage), weight(avgemp) 
by cz, sort: gen dup = cond(_N==0,1,_n)
drop if dup>1
drop dup

* Now to merge state data and replace where there are missing values.
merge m:m cz using cztostate
drop _merge
merge m:m state using statewage
replace weighted_wage = statewage if mi(weighted_wage)
drop _merge


**** To match the QCEW data to the masterdataset
joinby cz using masterdataset

save masterdataset, replace
