Describe "ContosoConfig" -Tag "All","Privilege" {
    It "CST.1111: Check approved Teams Administrator" -Tag "CST.1111" {

        # Approved list of Teams Administrator
        $approvedTeamsAdmin = @("GA-Lukas@MODERNCOMMS474864.onmicrosoft.com")

        # Get all Teams Administrator
        $AdminRole = Invoke-MtGraphRequest -RelativeUri "directoryRoles" | Where-Object { $_.displayName -eq "Teams Administrator" }
        $roleMembers = (Invoke-MtGraphRequest -RelativeUri "directoryRoles/$($AdminRole.id)/members").userPrincipalName

        # Check if the Teams Administrators are approved
        $roleMembers | Should -BeIn $approvedTeamsAdmin
    }
}