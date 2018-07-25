#This script allows you to import many users from a .CSV file to a Distribution list
#The script must be edited before use
# Could also be different : Import-CSV FileName.csv | ForEach {Add-DistributionGroupMember -Identity "GroupName" -Member $_.NTlogin}
Import-Csv C:\email2.csv | foreach {Add-DistributionGroupMember -Identity "Cata-test-DL" -Member $_.email} 