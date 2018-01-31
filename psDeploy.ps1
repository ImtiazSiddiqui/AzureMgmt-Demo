param(
    [Parameter(Mandatory=$true)]
    [string]$RGNumber
)
$userName = 'readyAdmin'
$deploymentName = "ReadyDemo$RGNumber"
$templateuri = 'https://raw.githubusercontent.com/mgreenegit/azure-quickstart-templates/mgreenegit-azmgmt-demo/azmgmt-demo/azuredeploy.json'
$RgName = "ContosoDev-ReadyDemo$RGNumber"
$WRgName = "ContosoDev-ReadyDemoVM$RGNumber"

$Rg = New-AzureRmResourceGroup -Name $RgName -Location eastus -Verbose -Force
$WRg = New-AzureRmResourceGroup -Name $WRgName -Location eastus -Verbose -Force

New-AzureRmResourceGroupDeployment -Name $deploymentName `
                                   -ResourceGroupName $Rg.ResourceGroupName `
                                   -TemplateUri $templateUri `
                                   -vmResourceGroup $WRg.ResourceGroupName `
                                   -userName $userName `
                                   -Verbose