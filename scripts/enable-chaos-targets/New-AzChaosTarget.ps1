<#
.SYNOPSIS
    Onboards an Azure Chaos Studio target and capability.
.DESCRIPTION
    Onboards an an Azure Chaos Studio target and capability.
    More information:
        - https://docs.microsoft.com/en-us/rest/api/chaosstudio/target-types/list
        - https://docs.microsoft.com/en-us/rest/api/chaosstudio/targets/create-or-update
        - https://docs.microsoft.com/en-us/rest/api/chaosstudio/capability-types/
        - https://docs.microsoft.com/en-us/rest/api/chaosstudio/capabilities/create-or-update
.EXAMPLE
    PS C:\> .\New-AzChaosTarget.ps1 -ResourceId "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/tvl-azcs-rg/providers/Microsoft.Network/networkSecurityGroups/tvl-azcs-nsg" -TargetName "microsoft-networksecuritygroup" -CapabilityName "SecurityRule-1.0"
#>
[CmdletBinding()]
param (
    [Parameter(
        Mandatory = $true,
        HelpMessage = "Provide the Azure Resource ID.")]
    [string]
    $ResourceId,
    [Parameter(
        Mandatory = $true,
        HelpMessage = "Provide Azure Chaos Studio target type name.")]
    [string]
    $TargetName,
    [Parameter(
        Mandatory = $true,
        HelpMessage = "Provide Azure Chaos Studio capability type name.")]
    [string]
    $CapabilityName
)
$ErrorActionPreference = 'Stop'

$context = Get-AzContext
if (!$context) {
    Write-Error -Message "Not connected to Azure account."
}
else {
    $createTargetPath = '{0}/providers/Microsoft.Chaos/targets/{1}?api-version=2021-09-15-preview' -f $ResourceId, $TargetName
    $createTargetResponse = Invoke-AzRestMethod -Path $createTargetPath -Method PUT -Payload '{"properties": {}}'
    if ($createTargetResponse.StatusCode -ge 400) {
        Write-Error -Message "Create Target: $($createTargetResponse.Content)"
    }
    else {
        Write-Information -MessageData "Create Target: $($createTargetResponse.Content)"
    }

    $createCapabilityPath = '{0}/providers/Microsoft.Chaos/targets/{1}/capabilities/{2}?api-version=2021-09-15-preview' -f $ResourceId, $TargetName, $CapabilityName
    $createTargetCapabilityResponse = Invoke-AzRestMethod -Path $createCapabilityPath -Method PUT -Payload '{"properties": {}}'
    if ($createTargetCapabilityResponse.StatusCode -ge 400) {
        Write-Error -Message "Create Capability: $($createTargetRescreateTargetCapabilityResponseponse.Content)"
    }
    else {
        Write-Information -MessageData "Create Capability: $($createTargetRescreateTargetCapabilityResponseponse.Content)"
    }

    $DeploymentScriptOutputs = @{}
    $DeploymentScriptOutputs['chaosStudioTargetId'] = '{0}/providers/Microsoft.Chaos/targets/{1}' -f $ResourceId, $TargetName
}
