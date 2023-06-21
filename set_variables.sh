

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
