#Find all the Distribution Groups a user is a member of with PowerShell in Office 365 - This script is not working 100%, depends of the environment 
$Username = "user@domain.com"
$DistributionGroups= Get-DistributionGroup -ResultSize Unlimited| where { (Get-DistributionGroupMember $_.Name | foreach {$_.PrimarySmtpAddress}) -contains "$Username"}
$DistributionGroups
