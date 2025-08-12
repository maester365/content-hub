# Uninstall Mopdules
Uninstall-Module Pester -Force
Uninstall-Module Maester
Uninstall-Module Microsoft.Graph.Authentication
Uninstall-Module Az.Accounts
Uninstall-Module ExchangeOnlineManagement
Uninstall-Module MicrosoftTeams

# Get script path and set it as current location
[string]$ScriptPath = Switch ($host.name){
    'Visual Studio Code Host' { Split-Path $PsEditor.GetEditorContext().CurrentFile.Path;$TempPathHost = $PsEditor.GetEditorContext().CurrentFile.Path.split("\");[string]$ScriptName=$TempPathHost[($TempPathHost.Length -1)] }
    'Windows PowerShell ISE Host' {  Split-Path -Path $psISE.CurrentFile.FullPath;[string]$ScriptName=$psISE.CurrentFile.DisplayName }
    'ConsoleHost' { $PsScriptRoot;[string]$ScriptName=$MyInvocation.MyCommand.Name}
}
Set-Location $ScriptPath

# Remove tests
Remove-Item -Path .\maester-tests -Recurse -Force

# Remove test results
Remove-Item -Path .\test-results -Recurse -Force