# Cloud Account Env Variables
export AWS_REGION=$(curl -s metadata.udf/cloudAccounts | jq -r .cloudAccounts[0].regions[7])
export AWS_ACCESS_KEY_ID=$(curl -s metadata.udf/cloudAccounts | jq -r .cloudAccounts[0].apiKey)
export AWS_SECRET_ACCESS_KEY=$(curl -s metadata.udf/cloudAccounts | jq -r .cloudAccounts[0].apiSecret)
export VOL_API_URL=$(curl -s http://metadata.udf/deploymentTags | jq -r .F5XCapiURL)

# Cloud Deployment Env Variables
export TF_VAR_owner=$(curl -s http://metadata.udf/deployment | jq -r .deployment.deployer) 
export TF_VAR_suffix=$(echo $TF_VAR_owner | cut -d'.' -f2 | cut -d'@' -f1)
export TF_VAR_namespace=$(echo $TF_VAR_owner | cut -d '@' -f1 | sed 's/\./-/')

#echo "importing SSH Key"
#rm -f ~/.ssh/id_rsa*
#ssh-keygen -b 2048 -t rsa -f /home/ubuntu/.ssh/id_rsa -q -N ""
#export TF_VAR_ssh_key=$(cat /home/ubuntu/.ssh/id_rsa.pub)
export TF_VAR_ssh_key="null"
echo $TF_VAR_ssh_key

export TF_VAR_trusted_ip=$(curl -s ifconfig.me)
echo $TF_VAR_trusted_ip

# Project Related Env Variables (aka deploymentTags
DEPLOYTAGS=$(curl -s metadata.udf/deploymentTags | jq -r 'keys' | jq -cr '.[]')

for i in $DEPLOYTAGS
do
	value=$(curl -s metadata.udf/deploymentTags | jq -r .$i)
	export TF_VAR_${i}=$value
done
