﻿#O365 - Azure - Check MFA status for X user
Get-MsolUser -Userprincipalname user@domain.com | select DisplayName,UserPrincipalName,@{N="MFA Status"; E={ if( $_.StrongAuthenticationRequirements.State -ne $null){ $_.StrongAuthenticationRequirements.State} else { "Disabled"}}}
