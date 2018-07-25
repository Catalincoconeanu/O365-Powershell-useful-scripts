#This script must be edited before use
Remove-MailboxPermission -Identity user1@domain.com -User user2@domain.com  -AccessRights SendAs -InheritanceType All