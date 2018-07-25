#Display (View) RecipientTypeDetails configuration for X shared mailbox, SendAsEnabled and MessageCopyForSendonBehalfEnabled -state
$mbx = Read-Host "Enter Shared Mailbox Email address"
Get-Mailbox -Identity $mbx | Where {$_.RecipientTypeDetails -eq “SharedMailbox”} | FT Alias,MessageCopy*