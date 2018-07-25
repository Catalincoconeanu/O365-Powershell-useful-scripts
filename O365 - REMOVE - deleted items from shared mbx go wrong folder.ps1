#REMOVE - deleted items or sent items feature for X shared mailbox
$mbx = Read-host "Enter email address"
Set-Mailbox $mbx -MessageCopyForSentAsEnabled $false -MessageCopyForSendOnBehalfEnabled $false