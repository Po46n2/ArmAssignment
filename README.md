### ArmAssignment


This ARM Template creates:
* A Virtual Network
  * A Subnet
    * A Service Endpoint for Storage
    * A Service Endpoint for Key Vault
* An Azure Data Lake Gen 2 storage account with Blob and File services
* A Web App Service plan
    * A Web App Site with connection to the Storage  

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPo46n2%2FArmAssignment%2Fmaster%2Farmassignment_main.json" target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.png"/>
</a>

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FPo46n2%2FArmAssignment%2Fmaster%2Farmassignment_main.json" target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.png"/>
</a>  
  
  
#### Deploy from PowerShell:

```powershell
Connect-AzAccount

$RGN = 'ResourceGroupName'
$TF = 'TemplateFileFullPath'
$TPF = 'TemplateParameterFileFullPath'

Test-AzResourceGroupDeployment -ResourceGroupName $RGN -TemplateFile $TF -TemplateParameterFile $TPF
New-AzResourceGroupDeployment -ResourceGroupName $RGN -TemplateFile $TF -TemplateParameterFile $TPF

# On validation failure check the result details
$testReults = Test-AzResourceGroupDeployment ... 
$testReults.details.details
```
