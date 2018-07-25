#Check O365 Licenses for X user in O365
$email= Read-Host "Enter email address"
Get-MsolUser -all | Where-Object {$_.UserPrincipalName -like $email} |Format-List Displayname, licenses