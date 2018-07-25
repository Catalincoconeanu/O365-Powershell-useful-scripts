#View (displays) SEND AS permissions for Shared Mailbox
$mbx = Read-host "Enter email address"
Get-RecipientPermission $mbx | Where-Object {($_.IsInherited -eq $False) -and -not ($_.Trustee -like “NT AUTHORITY\SELF”) } | Select-Object Trustee, AccessRights 