#When deleted items or sent items from shared mailbox folders goes into personal inbox instead of shared mailbox folders
$mbx = Read-host "Enter email address"
Set-Mailbox $mbx -MessageCopyForSentAsEnabled $true -MessageCopyForSendOnBehalfEnabled $true