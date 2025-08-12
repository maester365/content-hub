# Get script path and set it as current location
[string]$ScriptPath = Switch ($host.name){
    'Visual Studio Code Host' { Split-Path $PsEditor.GetEditorContext().CurrentFile.Path;$TempPathHost = $PsEditor.GetEditorContext().CurrentFile.Path.split("\");[string]$ScriptName=$TempPathHost[($TempPathHost.Length -1)] }
    'Windows PowerShell ISE Host' {  Split-Path -Path $psISE.CurrentFile.FullPath;[string]$ScriptName=$psISE.CurrentFile.DisplayName }
    'ConsoleHost' { $PsScriptRoot;[string]$ScriptName=$MyInvocation.MyCommand.Name}
}
Set-Location $ScriptPath

# Get test files sorted by creation time (newest first)
$testFiles = Get-ChildItem .\test-results\TestResults-*.json | Sort-Object CreationTime -Descending

if ($testFiles.Count -lt 2) {
    Write-Error "At least 2 test result files are required for comparison"
    return
}

$tests = @{
    NewTest   = (Get-Content $testFiles[0].FullName | ConvertFrom-Json)
    PriorTest = (Get-Content $testFiles[1].FullName | ConvertFrom-Json)
}
Compare-MtTestResult @tests