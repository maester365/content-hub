# Get script path and set it as current location
[string]$ScriptPath = Switch ($host.name){
    'Visual Studio Code Host' { Split-Path $PsEditor.GetEditorContext().CurrentFile.Path;$TempPathHost = $PsEditor.GetEditorContext().CurrentFile.Path.split("\");[string]$ScriptName=$TempPathHost[($TempPathHost.Length -1)] }
    'Windows PowerShell ISE Host' {  Split-Path -Path $psISE.CurrentFile.FullPath;[string]$ScriptName=$psISE.CurrentFile.DisplayName }
    'ConsoleHost' { $PsScriptRoot;[string]$ScriptName=$MyInvocation.MyCommand.Name}
}
Set-Location $ScriptPath

# Create folder and set location
mkdir maester-tests | Out-Null
Set-Location .\maester-tests

# Create maester tests
Install-MaesterTests

# Set location to upper layer
Set-Location .\..

# Copy tests for BASS
Copy-Item -Path (Get-ChildItem -Path .\custom_tests) -Destination .\maester-tests\Custom
Write-Output ""