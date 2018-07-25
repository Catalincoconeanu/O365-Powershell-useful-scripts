#To use this script, ensure to run "Set-ExecutionPolicy -ExecutionPolicy Unrestricted"
#Coded by my coworker Alberto Castillo
#No error control flow is implemented so be careful
$version = 1.0

Function Get-UserMailboxCalendar {
    $user = Read-Host "Enter Email address"
    $user = $user + ":\calendar"
    Write-Host "Showing info for" $user
    Get-MailboxFolderPermission $user
}

Function Set-UserMailboxCalendar {
    $user = Read-Host "Enter Email address"
    $user = $user + ":\calendar"
    $user1 = Read-Host "For who?"
    $typeaccess = Read-Host "Which right? (Editor,Reviewer,Owner)"
    Add-MailboxFolderPermission -Identity $user -User $user1 -AccessRights $typeaccess
    Write-Host "Ok, this is how it looks like"
    Get-MailboxFolderPermission $user
}
      
Function Remove-UserMailboxCalendar {
    $user = Read-Host "Enter Email address"
    $user = $user + ":\calendar"
    $user1 = Read-Host "Who do you want to remove?"
    Remove-MailboxFolderPermission -Identity $user –user $user1
    Write-Host "Ok, this is how it looks like"
    Get-MailboxFolderPermission $user
}
      
#Begin script
#Connect to Office 365
$credential = Get-Credential

#Connect to Exchange Online
$exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection
Import-PSSession $exchangeSession -DisableNameChecking


while ($true) {
    #Welcome message
    Write-Host "*********************************"
    Write-Host "WARNING: Script is usable, no error control is implemented so use at your own risk" -ForegroundColor Red
    Write-Host "Version:" $version
    Write-Host "Welcome"
    Write-Host ""
    Write-Host "1: View permissions over address' calendar"
    Write-Host "2: Grant Permissions over address' calendar"
    Write-Host "3: Delete permissions over address' calendar"
    Write-Host "4: Exit"

    Write-Host "*********************************"

    $selection = Read-Host "Select Option"

        switch ($selection)
         {
            1 {Get-UserMailboxCalendar; break}
            2 {Set-UserMailboxCalendar; break}
            3 {Remove-UserMailboxCalendar; break}
            4 {
                Remove-PSSession $exchangeSession
                exit; break
              }
            default {"Wrong selection"}
         }
 }
