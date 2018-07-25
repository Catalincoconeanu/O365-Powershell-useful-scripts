#View Shared Mailbox “Save a copy of sent mail items” settings
#The script must be edited before use
Get-Mailbox “Info Box” | Format-List Alias, MessageCopy* 