$User = Read-Host -Prompt 'Enter email address'
Get-MsolUser -UserPrincipalName $User | Format-List DisplayName,Licenses