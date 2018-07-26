#Set-give calendar permissions over calendar to another user, must be edited before use
#An similar example will be: Add-MailboxFolderPermission -Identity user1@domain.com:\Calendar -User user2@domain.com -AccessRights Editor -SharingPermissionFlags Delegate
Add-MailboxFolderPermission -Identity user1@domain.com:\Calendar -User user2@domain.com -AccessRights Editor
