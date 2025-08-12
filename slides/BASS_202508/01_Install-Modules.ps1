# Required
Install-Module Microsoft.Graph.Authentication -Scope CurrentUser ; Import-Module Microsoft.Graph.Authentication

Install-Module Pester -SkipPublisherCheck -Force -Scope CurrentUser ; Import-Module Pester
Install-Module Maester -Scope CurrentUser ; Import-Module Maester

# Optional
#Install-Module Microsoft.Graph -Scope CurrentUser #need to long for install in demo
Install-Module Az.Accounts -Scope CurrentUser ; Import-Module Az.Accounts
Install-Module ExchangeOnlineManagement -Scope CurrentUser ; Import-Module ExchangeOnlineManagement
Install-Module MicrosoftTeams -Scope CurrentUser ; Import-Module MicrosoftTeams


Get-Module