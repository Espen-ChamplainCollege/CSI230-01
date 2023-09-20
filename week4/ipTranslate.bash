ipAddr=$(bash ../week3/ipAddressWithoutPrefix.bash)
ipAddrPrefix=$(bash ../week3/ipAddressPrefix.bash)
printf "" > possibleIps.txt

bash ../week3/ipAddressCounter.bash $ipAddr $ipAddrPrefix

while read -r line
do
	bash ../week3/convBinaryIpToAddress.bash $line >> possibleIps.txt
done < ipAddresses.txt
