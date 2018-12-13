#Caso esteja executando no portal o proximo comando n�o se faz necess�rio
az login
#Lista as contas ativas
az account list
az account set -s <<subscriptionId>>
#Criando o Resource Group
az group create --location eastus2 --name RGWordPressTest
#Criando o App Service Plan
az appservice plan create --name AppSrvWordPressTest --sku B1 --is-linux --location eastus2 --resource-group RGWordPressTest
#Criando o Web App
az webapp create --name WebWordPressTest --plan AppSrvWordPressTest --deployment-container-image-name appsvcorg/wordpress-alpine-php:0.61 --resource-group RGWordPressTest
#Ap�s a cria��o o container come�a a ser constru�do e os logs podem ser acompanhados pelo comando:
az webapp log tail --name WebWordPressTest --resource-group RGWordPressTest