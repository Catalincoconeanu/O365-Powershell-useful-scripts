#This script is working little bit slow, depending on your everyoment 
Get-Mailbox | % { Get-MailboxFolderPermission (($_.PrimarySmtpAddress.ToString())+”:\Calendar”) -User *user@domain.com* -ErrorAction SilentlyContinue} | select Identity,User,AccessRights
