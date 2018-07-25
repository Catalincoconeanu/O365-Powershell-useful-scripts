#This script allows you to set a Skype static conference ID.
#This feature is not longer supported by Microsoft :(
Import-Module LyncOnlineConnector 
$credential = Get-Credential user@domain.com
$session = New-CsOnlineSession -Credential $credential 
Import-PSSession $session -AllowClobber

do{
    cls
    $username=read-host "User full name"
    $phone=read-host "User phone ending"
    Get-CsOnlineDialInConferencingUser -Identity $username
    pause
    #this pause was for review the information and check the current conferenceID assigned (0 to dynamic)
    Set-CsOnlineDialInConferencingUser -Identity $username  -ConferenceId $phone

    write-host "(Press any key to continue or type N to exit)"
    $continue=read-host "Wanna edit another one? "
}Until(($continue -eq "N") -or ($continue -eq "n"))

Remove-PSSession $session