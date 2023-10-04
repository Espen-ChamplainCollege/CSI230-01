while read -r ipAddr
do
        result=$(curl -s --head --max-time 1 $ipAddr | head -1 | cut -d " " -f 2)
        if [[ "$result" == "200" ]]; then
        	echo This IP Address has a website: $ipAddr
	fi

done < possibleIps.txt

