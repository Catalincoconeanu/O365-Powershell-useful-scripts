#Get Users with specific license type, must be edited before using
get-MSOLUser -All | where {$_.isLicensed -eq "TRUE" -and $_.Licenses.AccountSKUID -eq "domainname:VISIOONLINE_PLAN1"}
