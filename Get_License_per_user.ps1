Get-MsolUser -All | ?{$_.islicensed -eq $true} | select displayname, userprincipalname -ExpandProperty licenses | 
select displayname, Userprincipalname, AccountSkuid | 
Export-Csv -Path C:\Temp\LicensedUsers.CSV -Encoding ASCII -NoTypeInformation