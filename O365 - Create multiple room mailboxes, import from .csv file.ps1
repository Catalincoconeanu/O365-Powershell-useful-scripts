#Create multiple room mailboxes, import from .csv file
#Format:   Room , EmailAddress , Location , Capacity
Import-csv .\Rooms.csv | foreach{ New-Mailbox -Name $_.roomname -Room -PrimarySmtpAddress $_.emailaddress -ResourceCapacity $_.capacity }