Param (
    [Parameter(Mandatory=$true)] [string] $ResourceGroupName,
    [Parameter(Mandatory=$true)] [string] [ValidateSet("northeurope", "westeurope")] $Location,
    [Parameter(Mandatory=$true)] [string] $ResourcePrefix
)

$ResourceGroup = Get-AzureRmResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue

if ($null -eq $ResourceGroup) {
    $ResourceGroup = New-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location
}

$Parameters = @{}
$Parameters["resourcePrefix"] = $ResourcePrefix
$Parameters["storageSku"] = "Standard_LRS"

$Deployment = New-AzureRmResourceGroupDeployment -Name ($ResourceGroupName + '-deployment-' + ((Get-Date).ToUniversalTime()).ToString('MMdd-HHmm')) `
                                                 -ResourceGroupName $ResourceGroupName `
                                                 -TemplateFile "$($PSScriptRoot)/azuredeploy.json" `
                                                 -TemplateParameterObject $Parameters `
                                                 -Force `
                                                 -Verbose

Write-Host "Storage Account"
Write-Host "Account Name : $($Deployment.Outputs["storageAccountName"].Value)"
Write-Host "Connection String : $($Deployment.Outputs["storageAccountConnectionString"].Value)"
