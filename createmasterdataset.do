cd "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets"

* First, the maptile package and its corresponding editing package spmap must be installed.
ssc install maptile
ssc install spmap

* Then the specific type of geographic map must be installed. In this case it is the Commuting Zone cz2000
maptile_install using "http://files.michaelstepner.com/geo_cz2000.zip"

* To merge the crosswalk with the dataset
import excel "/Volumes/GoogleDrive/Team Drives/Think Tank/Tame the Top/Market Power and Antitrust/Sprint-TMobile Merger/Data/Data Sets/Market Overlap Analysis_Commuter Zones_20181029.xlsx", sheet("HHI Analysis_Commuter Zones") cellrange(A2:K711) firstrow clear

* Renaming the variable is necessary for the maptile package.
rename CommuterZoneCode cz
save masterdataset, replace
