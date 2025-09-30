$RG = "rg-sql-ping-mottu"
$LOCATION = "brazilsouth"
$SERVER_NAME = "sqlserver-pingmottu"
$USERNAME = "admsql"
$PASSWORD = "Fiap@2tdsvms"
$DBNAME = "db-ping-mottu"

az group create --name $RG --location $LOCATION
az sql server create -l $LOCATION -g $RG -n $SERVER_NAME -u $USERNAME -p $PASSWORD --enable-public-network true
az sql db create -g $RG -s $SERVER_NAME -n $DBNAME --service-objective Basic --backup-storage-redundancy Local --zone-redundant false
az sql server firewall-rule create -g $RG -s $SERVER_NAME -n AllowAll --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255

