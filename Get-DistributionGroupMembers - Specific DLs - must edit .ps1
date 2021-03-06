#This script will generate a report in .csv format with all the members of the X,Y,Z DLs from O366
#
#The part with:
#Get all Distribution Groups from Office 365 
# $objDistributionGroups = Get-DistributionGroup -ResultSize Unlimited -filter {name -like "den-xmas-2018" -or name -like "cata-test-dl" -or name -like "all denver"}
#*** Must be edited before use, so you can add the names of the desired DLs.*****
#The output .csv file gets generated in C:\ or C:\Users\%username%
#
#If you want to pull a .csv report with all the distribution lists and their members from O365, you have to replace the previous part 
#with this part:
##Get all Distribution Groups from Office 365 
#$objDistributionGroups = Get-DistributionGroup -ResultSize Unlimited 
#
#Accept input parameters 
Param( 
    [Parameter(Position=0, Mandatory=$false, ValueFromPipeline=$true)] 
    [string] $Office365Username, 
    [Parameter(Position=1, Mandatory=$false, ValueFromPipeline=$true)] 
    [string] $Office365Password 
) 
 
#Constant Variables 
$OutputFile = "DistributionGroupMembers.csv"   #The CSV Output file that is created, change for your purposes 
$arrDLMembers = @{} 
 

#Remove all existing Powershell sessions 
Get-PSSession | Remove-PSSession 
 
#Did they provide creds?  If not, ask them for it.
if (([string]::IsNullOrEmpty($Office365Username) -eq $false) -and ([string]::IsNullOrEmpty($Office365Password) -eq $false))
{
    $SecureOffice365Password = ConvertTo-SecureString -AsPlainText $Office365Password -Force     
     
    #Build credentials object 
    $Office365Credentials  = New-Object System.Management.Automation.PSCredential $Office365Username, $SecureOffice365Password 
}
else
{
	#Build credentials object 
    $Office365Credentials  = Get-Credential
}
#Create remote Powershell session 
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Office365credentials -Authentication Basic –AllowRedirection         

#Import the session 
Import-PSSession $Session -AllowClobber | Out-Null          
 
#Prepare Output file with headers 
Out-File -FilePath $OutputFile -InputObject "Distribution Group DisplayName,Distribution Group Email,Member DisplayName, Member Email, Member Type" -Encoding UTF8 
 
#Get all Distribution Groups from Office 365 
$objDistributionGroups = Get-DistributionGroup -ResultSize Unlimited -filter {name -like "den-xmas-2018" -or name -like "cata-test-dl" -or name -like "all denver"}

 
#Iterate through all groups, one at a time     
Foreach ($objDistributionGroup in $objDistributionGroups) 
{     
	
	write-host "Processing $($objDistributionGroup.DisplayName)..." 
 
	#Get members of this group 
	$objDGMembers = Get-DistributionGroupMember -Identity $($objDistributionGroup.PrimarySmtpAddress) 
	 
	write-host "Found $($objDGMembers.Count) members..." 
	 
	#Iterate through each member 
	Foreach ($objMember in $objDGMembers) 
	{ 
		Out-File -FilePath $OutputFile -InputObject "$($objDistributionGroup.DisplayName),$($objDistributionGroup.PrimarySMTPAddress),$($objMember.DisplayName),$($objMember.PrimarySMTPAddress),$($objMember.RecipientType)" -Encoding UTF8 -append 
		write-host "`t$($objDistributionGroup.DisplayName),$($objDistributionGroup.PrimarySMTPAddress),$($objMember.DisplayName),$($objMember.PrimarySMTPAddress),$($objMember.RecipientType)"
	} 
} 

#Clean up session 
Get-PSSession | Remove-PSSession 

