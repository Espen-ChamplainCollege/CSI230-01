logDir="/var/log/apache2/access.log"
day=$(date | cut -d " " -f 3)
month=$(date | cut -d " " -f 2)
year=$(date | cut -d " " -f 7)
currentDate=$day/$month/$year

ips=$(grep -e $currentDate $logDir | cut -d " " -f 1 | sort | uniq -c | sort -bgr)

i=1

printf "Number of accesses\tIp Address\n"
for string in $ips
do
	temp=$(( $i%2 ))
	if [[ $temp == "1" ]]; then
		printf "%s\t\t\t" $string
	else
		printf "%s\n" $string
	fi

	(( i++ ))
done
