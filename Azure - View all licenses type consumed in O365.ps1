#View all licenses type consumed in O365 Azure
Get-AzureADSubscribedSku | Select -Property Sku*,ConsumedUnits -ExpandProperty PrepaidUnits | Format-List Skupartnumber,consumedunits,enabled