#-SharingPermissionFlags,CanViewPrivateItems
Add-MailboxFolderPermission -Identity user1@domain.com:\Calendar -User user2@domain.com  -AccessRights Editor -SharingPermissionFlags Delegate
