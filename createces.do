***** To retrieve inflation data *****

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets"

copy https://download.bls.gov/pub/time.series/cu/cu.data.1.AllItems inflation.txt, text replace

import delimited "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/inflation.txt", encoding(ISO-8859-1)clear

keep if series_id == "CUSR0000SA0      "

keep year period value
rename period month
rename value cpi_adjuster

save inflation, replace

***** To retrieve employment data *****

cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets"

copy https://download.bls.gov/pub/time.series/ce/ce.data.42a.RetailTrade.Employment cesemployment.txt, text replace

import delimited "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/cesemployment.txt", encoding(ISO-8859-1)clear

* To keep only seasonally adjusted data
gen seasonal = substr(series_id,1,3)
keep if seasonal == "CES"

* To keep only production and nonsupervisory employee data
gen prod = substr(series_id,12,13)
destring prod, replace
keep if prod == 6

* To create a six digit industry variable
gen industry = substr(series_id,6,11)
replace industry = substr(industry,1,6)

* Since we only need data for the electronic stores, we can drop the rest
keep if industry == "443142"

* To keep variables of interest
rename value employment
rename period month
keep year month employment
save employment, replace



***** To retrieve earnings data ****

***** Weekly Earnings *****

copy https://download.bls.gov/pub/time.series/ce/ce.data.42c.RetailTrade.ProductionEmployeeHoursAndEarnings cesweekly.txt, text replace

import delimited "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/cesweekly.txt", encoding(ISO-8859-1)clear

* To extract weekly and hourly earnings for production employees.
gen sub = substr(series_id,12,13)
destring sub, replace
keep if sub == 30

gen weekly_earnings = value if sub == 30

* To keep only seasonally adjusted data
gen seasonal = substr(series_id,1,3)
keep if seasonal == "CES"

* To create a six digit industry variable
gen industry = substr(series_id,6,11)
replace industry = substr(industry,1,6)

* Since we only need data for the electronic stores, we can drop the rest
keep if industry == "443142"

rename period month
save weekly, replace


**** Average Hours Worked ****

copy https://download.bls.gov/pub/time.series/ce/ce.data.42c.RetailTrade.ProductionEmployeeHoursAndEarnings cesweekly.txt, text replace

import delimited "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/cesweekly.txt", encoding(ISO-8859-1)clear

* To extract weekly and hourly earnings for production employees.
gen sub = substr(series_id,12,13)
destring sub, replace
keep if sub == 07

gen hours_worked = value if sub == 07

* To keep only seasonally adjusted data
gen seasonal = substr(series_id,1,3)
keep if seasonal == "CES"

* To create a six digit industry variable
gen industry = substr(series_id,6,11)
replace industry = substr(industry,1,6)

* Since we only need data for the electronic stores, we can drop the rest
keep if industry == "443142"

rename period month

save hours, replace


***** Hourly Earnings *****

import delimited "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/cesweekly.txt", encoding(ISO-8859-1)clear

* To extract weekly and hourly earnings for production employees.
gen sub = substr(series_id,12,13)
destring sub, replace
keep if sub == 08

gen hourly_earnings = value if sub == 08

* To keep only seasonally adjusted data
gen seasonal = substr(series_id,1,3)
keep if seasonal == "CES"

* To create a six digit industry variable
gen industry = substr(series_id,6,11)
replace industry = substr(industry,1,6)

* Since we only need data for the electronic stores, we can drop the rest
keep if industry == "443142"

save hourly, replace



*** To combine all the datasets and do the analysis ****
use hourly, clear

* To merge the four datasets
rename period month
joinby year month using weekly
joinby year month using hours
joinby year month using employment
joinby year month using inflation


* To keep variables of interest
keep year month weekly_earnings hourly_earnings hours employment cpi_adjuster

gen cpi = 1 + (251.846 - cpi_adjuster)/cpi_adjuster
gen adj_weekly_earnings = weekly_earnings * cpi
gen adj_hourly_earnings = hourly_earnings * cpi


* To format date
replace month = substr(month,2,3)
destring month, replace
gen date = ym(year, month)
format date %tm

* To label variables
label var date "Date"
label var weekly_earnings "Weekly Earnings in Nominal Dollars"
label var adj_weekly_earnings "Weekly Earnings in Real Dollars"
label var hourly_earnings "Hourly Earnings in Nominal Dollars"
label var adj_hourly_earnings "Hourly Earnings in Real Dollars"
label var hours "Average Hours Worked per Week"
label var employment "Employment in Thousands"

save cesdataset, replace




