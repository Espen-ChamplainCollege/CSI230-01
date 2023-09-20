bash ipTranslate.bash
printf "Active Hosts:\n" > activeHosts.txt

while read -r line
do
	junkOutput=$(ping -c 2 $line)
	if [[ $? -eq 0 ]]; then
		echo $line >> activeHosts.txt
	fi
done < possibleIps.txt
