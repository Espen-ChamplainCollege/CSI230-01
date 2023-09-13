ipAddrPrefix=$(bash ipAddressPrefix.bash)
subMask=""

for i in $(seq 1 32)
do
	if [[ ${i} -le ${ipAddrPrefix} ]];
	then
		subMask+="1"
	else
		subMask+="0"
	fi
done
echo ${subMask}
