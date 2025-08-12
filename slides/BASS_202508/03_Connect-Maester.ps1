# Relegated permissions
# Connect to all Services and Consent Permissions
Connect-Maester -Service All -Privileged

# Or 

Connect-Maester -Service Azure,Graph,Teams, SecurityCompliance, ExchangeOnline -Privileged

# Or (without permission grants)

Connect-MgGraph

# Or

Connect-MgGraph -Scopes DeviceManagementConfiguration.Read.All, DeviceManagementManagedDevices.Read.All, Directory.Read.All, DirectoryRecommendations.Read.All, IdentityRiskEvent.Read.All, Policy.Read.All, Policy.Read.ConditionalAccess, PrivilegedAccess.Read.AzureAD, Reports.Read.All, RoleEligibilitySchedule.Read.Directory, RoleManagement.Read.All, SecurityIdentitiesSensors.Read.All, SecurityIdentitiesHealth.Read.All, RoleEligibilitySchedule.ReadWrite.Directory, DeviceManagementConfiguration.ReadWrite.All

# Other services
Connect-AzAccount #-> needed permissions in azure

# Not in demo
Connect-ExchangeOnline #-> needed permissions in exo
Connect-IPPSSession #-> needed permissions in exo
Connect-MicrosoftTeams #-> needed permissions in teams