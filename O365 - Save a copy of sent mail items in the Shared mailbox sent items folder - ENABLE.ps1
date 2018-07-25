#Save a copy of sent mail items in the Shared mailbox sent items folder - ENABLE the feature
#Example: Set-Mailbox Bob -MessageCopyForSendOnBehalfEnabled $True
Set-Mailbox -Identity <identity> -MessageCopyForSendOnBehalfEnabled $True