#View all users who have X type of license in O365
#The License -match Enterprisepack can be different, consult command Get-MsolAccountSku to check names
Get-MsolUser -all| Where-Object {($_.licenses).AccountSkuId -match "PROJECTPROFESSIONAL" } | Out-File c:\License.csv