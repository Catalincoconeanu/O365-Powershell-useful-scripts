#View Room ( Conference room )  mailbox details
#The script must be edited before use
Get-Mailbox -ResultSize unlimited -Filter {(RecipientTypeDetails -eq 'RoomMailbox')