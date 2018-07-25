# View all the users who have access to X shared mailbox
$mbx = Read-host "Enter email address"
Get-MailboxPermission $mbx | Where-Object { ($_.IsInherited -eq $False) -and -not ($_.User -like “NT AUTHORITY\SELF”) } | Select-Object Identity, user, AccessRights 