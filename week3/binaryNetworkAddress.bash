binaryIpAddr=$(bash binaryIpAddress.bash)
binarySubnetMask=$(bash binarySubnetMask.bash)
binaryNetworkAddr=""

for i in $(seq 0 31)
do
	if [[ "${binarySubnetMask:$i:1}" == "1" ]];
	then
		binaryNetworkAddr+=${binaryIpAddr:$i:1}
	else
		binaryNetworkAddr+="0"
	fi
done

echo ${binaryNetworkAddr}
