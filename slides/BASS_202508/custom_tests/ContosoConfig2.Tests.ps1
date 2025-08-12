Describe "ContosoConfig2" -Tag "All","Privilege" {
    It "CST.2222: Check approved Teams Administrator with Better description" -Tag "CST.2222" {

        # Approved list of Teams Administrator
        $approvedTeamsAdmin = @("GA-Lukas@MODERNCOMMS474864.onmicrosoft.com")

        # Get all Teams Administrator
        $AdminRole = Invoke-MtGraphRequest -RelativeUri "directoryRoles" | Where-Object { $_.displayName -eq "Teams Administrator" }
        $roleMembers = (Invoke-MtGraphRequest -RelativeUri "directoryRoles/$($AdminRole.id)/members").userPrincipalName

        try {
            # Create detailed output
            $approvedMembers = $roleMembers | Where-Object { $_ -in $approvedTeamsAdmin }
            $notApprovedMembers = $roleMembers | Where-Object { $_ -notin $approvedTeamsAdmin }
            
            $testResultMarkdown = ""
            
            if ($approvedMembers.Count -gt 0) {
                $testResultMarkdown += "**Approved Teams Administrators:**`n"
                foreach ($member in $approvedMembers) {
                    $testResultMarkdown += "✅ $member`n"
                }
                $testResultMarkdown += "`n"
            }
            
            if ($notApprovedMembers.Count -gt 0) {
                $testResultMarkdown += "**Non-approved Teams Administrators:**`n"
                foreach ($member in $notApprovedMembers) {
                    $testResultMarkdown += "❌ $member`n"
                }
                $testResultMarkdown += "`n"
            }
            
            if ($roleMembers.Count -eq 0) {
                $testResultMarkdown += "No Teams Administrators found.`n"
            }
            
            # Add the detailed output first
            Add-MtTestResultDetail -Description $testResultMarkdown
        } catch {
            Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        }   

        # Check if the Teams Administrators are approved
        # The test should fail if there are any non-approved members
        $notApprovedMembers.Count | Should -Be 0 -Because "Test"
    }
}