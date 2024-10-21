# Script to define regional settings on Azure Virtual Machines deployed from the market place
# Author: James Brown
#######################################3

#variables
$regionalsettingsURL = "https://github.com/brownnetuk/Azure/blob/51d1bb1356bb240c5c048273e2f5aa441b8d1157/AVD/RegionalSettings/en-gb.xml"
$RegionalSettings = "C:\IT\en-gb.xml"


#downdload regional settings file
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($regionalsettingsURL,$RegionalSettings)


# Set Locale, language etc. 
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$RegionalSettings`""

# Set languages/culture. Not needed perse.
Set-WinSystemLocale en-GB
Set-WinUserLanguageList -LanguageList en-GB -Force
Set-Culture -CultureInfo en-GB
Set-WinHomeLocation -GeoId 242
Set-TimeZone -Name "GMT Standard Time"

# restart virtual machine to apply regional settings to current user. You could also do a logoff and login.
Start-sleep -Seconds 40
Restart-Computer
