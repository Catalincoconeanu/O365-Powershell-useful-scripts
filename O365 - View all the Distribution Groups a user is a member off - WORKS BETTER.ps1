#Find all the Distribution Groups a user is a member of with PowerShell in Office 365 - THIS WORKS FASTER AND NO ERRORS
Write-Host "This tool displays the Distrbution lists a user is a member of"
$User = Read-Host -Prompt 'email address you would like to find the distribution lists of'
$Mailbox=get-Mailbox "$User"
$DN=$mailbox.DistinguishedName
$Filter = "Members -like ""$DN"""
Get-DistributionGroup -ResultSize Unlimited -Filter $Filter