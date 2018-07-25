#Display a list of all Shared mailboxes that their RecipientTypeDetails option is “True” or "False" -must edit the attribute
#Note to edit the -eq $True or $False attribute
#Purpose of this script is to check all your domain shared mailboxes RecipientTypeDetails configuration or state for MessageCopyForSentAsEnabled
Get-Mailbox | Where {$_.RecipientTypeDetails -eq “SharedMailbox” -and $_.MessageCopyForSentAsEnabled -eq $True} | FT Alias,MessageCopy*