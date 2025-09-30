
# Variáveis
RESOURCE_GROUP_NAME="rg-ping-mottu"
WEBAPP_NAME="ping-mottu"
APP_SERVICE_PLAN="ping-mottu"
LOCATION="brazilsouth"
RUNTIME="JAVA:17-java17"
GITHUB_REPO_NAME="gustavo295/pingmottu-webapp"
BRANCH="main"

# Criação do Grupo de Recursos
az group create \
  --name $RESOURCE_GROUP_NAME \
  --location "$LOCATION"


# Criar o Plano de Serviço
az appservice plan create \
  --name $APP_SERVICE_PLAN \
  --resource-group $RESOURCE_GROUP_NAME \
  --location "$LOCATION" \
  --sku F1 \
  --is-linux


# Criar o Serviço de Aplicativo
az webapp create \
  --name $WEBAPP_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --plan $APP_SERVICE_PLAN \
  --runtime "$RUNTIME"

az webapp list-runtimes


# Habilita a autenticação Básica (SCM)
az resource update \
  --resource-group $RESOURCE_GROUP_NAME \
  --namespace Microsoft.Web \
  --resource-type basicPublishingCredentialsPolicies \
  --name scm \
  --parent sites/$WEBAPP_NAME \
  --set properties.allow=true



# Configurar as Variáveis de Ambiente necessárias do nosso App 

az webapp config appsettings set \
  --name "ping-mottu" \
  --resource-group "rg-ping-mottu" \
  --settings \
    SPRING_DATASOURCE_USERNAME="admsql" \
    SPRING_DATASOURCE_PASSWORD="Fiap@2tdsvms" \
    SPRING_DATASOURCE_URL="jdbc:sqlserver://sqlserver-pingmottu.database.windows.net:1433;database=db-ping-mottu;user=admsql@sqlserver-pingmottu;password={your_password_here};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;"


# Reiniciar o Web App
az webapp restart --name $WEBAPP_NAME --resource-group $RESOURCE_GROUP_NAME


# Configurar GitHub Actions para Build e Deploy automático
az webapp deployment github-actions add \
  --name $WEBAPP_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --repo $GITHUB_REPO_NAME \
  --branch $BRANCH \
  --login-with-github




