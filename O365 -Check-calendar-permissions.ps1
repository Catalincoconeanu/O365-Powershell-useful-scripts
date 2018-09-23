#The script must be edited before use, edit the domain name.
#This script will check permissions on a user's calendar, if it is not the default calendar
# you will be prompted with yes or no, you will be asked to type in the name of the calendar
#(it must be an exact match) and permissions from that calendar will be displayed
#If the user selects no, permissions will displayed from their main calendar

#This script  assumes a connection to Exchange Online

Write-Host 'Please type in the alias name for the calendar' -ForegroundColor Green -BackgroundColor Black

$username = Read-Host -Prompt 'Alias'

write-host 'Is this a secondary (non default) calendar' -ForegroundColor Green -BackgroundColor Black 
$sec = read-host ' Y or N, default is N' 
switch($sec){  
#substitute contoso with the name of your domain
Y{ $secname = read-host -Prompt 'Please type the name of the secondary calendar, must be an exact match'
get-MailboxFolderPermission -Identity $username@domain.com:\Calendar\$secname| fl}
N{get-MailboxFolderPermission -Identity $username@domain.com:\Calendar| fl}
Default{get-MailboxFolderPermission -Identity $username@domain.com:\Calendar| fl}
}

