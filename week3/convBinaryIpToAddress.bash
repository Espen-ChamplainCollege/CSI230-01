binaryIpAddr=$1
ipAddr=""

for i in $(seq 1 4)
do
	charNum=$(( $i*8 ))
	lowerBound=$(( $charNum-7 ))
	upperBound=$(( $charNum ))
	ipAddrSection=$(echo $binaryIpAddr | cut -c $lowerBound-$upperBound)
	ipAddr+=$((2#$ipAddrSection))

	if [[ $i != 4 ]];
	then
		ipAddr+="."
	fi
done

echo ${ipAddr}
