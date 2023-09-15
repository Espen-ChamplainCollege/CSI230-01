ipAddr=$(bash ipAddressWithoutPrefix.bash)
binaryIpAddr=""

for i in 1 2 3 4
do
	ipAddrSection=$(echo ${ipAddr} | cut -d "." -f ${i})
	binaryIpAddr+=$(printf "%08d" $(echo "obase=2;$ipAddrSection" | bc))
done
echo ${binaryIpAddr}
