ipAddr=$1
ipAddrPrefix=$2
printf "" > ipAddresses.txt

binaryIpAddr=""

for i in 1 2 3 4
do
        ipAddrSection=$(echo ${ipAddr} | cut -d "." -f ${i})
	binaryIpAddr+=$(printf "%08d" $(echo "obase=2;$ipAddrSection" | bc))
done

binaryNetworkAddr=$(echo $binaryIpAddr | cut -c -$ipAddrPrefix)

numSections=$(( $(( 32-$ipAddrPrefix )) / 8 ))

if [[ numSections -eq 1 ]]; then
	for i in $(seq 1 254)
	do
		addrSection=$(printf "%08d" $(echo "obase=2;$i" | bc))
		echo $binaryNetworkAddr$addrSection >> ipAddresses.txt
	done

elif [[ numSections -eq 2 ]]; then
	for i in $(seq 1 254)
        do
                addrSection=$(printf "%08d" $(echo "obase=2;$i" | bc))
                for j in $(seq 1 254)
       		do
                	addrSection2=$(printf "%08d" $(echo "obase=2;$j" | bc))
                	echo $binaryNetworkAddr$addrSection$addrSection2 >> ipAddresses.txt
        	done

	done

elif [[ numSections -eq 3 ]]; then
	for i in $(seq 1 254)
        do
                addrSection=$(printf "%08d" $(echo "obase=2;$i" | bc))
                for j in $(seq 1 254)
                do
                        addrSection2=$(printf "%08d" $(echo "obase=2;$j" | bc))
                        
			for g in $(seq 1 254)
                	do
                        	addrSection3=$(printf "%08d" $(echo "obase=2;$g" | bc))
                        	echo $binaryNetworkAddr$addrSection$addrSection2$addrSection3 >> ipAddresses.txt
                	done

                done

        done
else
	echo "Invalid Prefix Given"
fi


