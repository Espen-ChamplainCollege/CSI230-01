printf "" > webservers.txt

while read -r ipAddr
do
	result=$(curl -s --head $ipAddr | head -1 | cut -d " " -f 2)
	if [[ "$result" == "200" ]]; then
		echo $ipAddr >> webservers.txt
	fi

done < activeHosts.txt
