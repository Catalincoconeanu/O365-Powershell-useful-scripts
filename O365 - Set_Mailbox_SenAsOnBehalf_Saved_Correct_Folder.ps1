#Set all sent emails to appear in the shared mailbox sent items
#The script must be edited before use
set-mailbox sharedmailbox@doamin.com -MessageCopyForSentAsEnabled $True
set-mailbox sharedmailbox@doamin.com -MessageCopyForSendOnBehalfEnabled $True