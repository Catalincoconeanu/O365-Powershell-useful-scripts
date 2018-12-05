#This will allow you to check last sync time for X user
#You must be connect to O365 Service before use
#Use Connect-MsolService
$User = Read-Host -Prompt 'Enter Email Address'
get-msoluser -UserPrincipalName $User | Select-Object LastDirSyncTime, DirSyncProvisioningErrors, ValiadtionStatus