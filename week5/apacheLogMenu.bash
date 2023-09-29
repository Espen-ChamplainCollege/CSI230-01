logDir="/var/log/apache2/access.log"
day=$(date | cut -d " " -f 3)
month=$(date | cut -d " " -f 2)
year=$(date | cut -d " " -f 7)
currentDate=$day/$month/$year

function listIps ()
{
	cut -d ' ' -f 1 $logDir | sed 's/127.0.0.1//g' | awk NF > clientIPs.txt
	
}

function visitors ()
{	
	for line in $(cat clientIPs.txt | sort | uniq)
	do
		printf "%s %s\n" $(egrep $currentDate $logDir | egrep -c $line) $line
	done
}

function badClients ()
{
	printf "" > blacklisted.txt
	local oneHourAgo=$(date -d '1 hour ago' +%H)
	local timePattern=$(echo $currentDate:$oneHourAgo)
	local lineNum=$(egrep -n -m 1 $timePattern $logDir | cut -d ":" -f 1)
	local lineNumRange=$(echo '1,'$lineNum'd')

	for line in $(cat clientIPs.txt | sort | uniq)
	do
		local count=$(sed $lineNumRange $logDir | egrep $line | grep -E -c " 400 | 403 | 404 ")
		if [[ $count -gt 3 ]]; then
			echo $line >> blacklisted.txt
		fi
	done
}

function histogram ()
{
	local visitsPerDay=$(grep -e " 200 " $logDir | cut -d " " -f 4 | cut -d ":" -f 1 | tr -d '[' | sort | uniq -c | sort -bgr)

	i=1

	for string in $visitsPerDay
	do
        	local temp=$(( $i%2 ))
        	if [[ $temp == "1" ]]; then
                	printf "%s visits on " $string
        	else
                	printf "%s\n" $string
        	fi

        	(( i++ ))
	done
	
}

function block ()
{
	while read -r line
	do
		iptables -A INPUT -s $line -j DROP
	done < blacklisted.txt
}

function resetblocks ()
{
	iptables -F
}

while :
do
        echo "Please select an option:"
        echo "[1] Number of Visitors"
        echo "[2] Display Visitors"
        echo "[3] Show Bad Visits"
        echo "[4] Block Bad Visits"
        echo "[5] Reset Block Rules"
        echo "[6] Show Visit Histogram"
	echo "[7] Quit"

        read userInput
	echo ""
	
        if [[ "$userInput" == "1" ]]; then
                listIps
		printf "Number of visits: %s\n" $(cat clientIPs.txt | grep . -c)

        elif [[ "$userInput" == "2" ]]; then
                visitors | sort -bgr

        elif [[ "$userInput" == "3" ]]; then
                badClients
		cat blacklisted.txt

        elif [[ "$userInput" == "4" ]]; then
                block
		echo Bad Clients Blocked!

        elif [[ "$userInput" == "5" ]]; then
                resetblocks
		echo Blocked Clients Reset!

        elif [[ "$userInput" == "6" ]]; then
                histogram

	elif [[ "$userInput" == "7" ]]; then
		break

        else
                echo "Please enter a valid option"
        fi

        echo ""
done

