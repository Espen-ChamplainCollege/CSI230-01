printf "<html>\n\t<body>\n\t\t<table>\n" > accessLogs.html
printf "\t\t\t<tr>\n" >> accessLogs.html
printf "\t\t\t\t<th>Ip Address</th>\n" >> accessLogs.html
printf "\t\t\t\t<th>Time Accessed</th>\n" >> accessLogs.html
printf "\t\t\t\t<th>Page Accessed</th>\n" >> accessLogs.html
printf "\t\t\t\t<th>Method of Access</th>\n" >> accessLogs.html
printf "\t\t\t</tr>\n" >> accessLogs.html

while read -r line
do	
	printf "\t\t\t<tr>\n" >> accessLogs.html

	
	ip=$(echo $line | cut -d " " -f 1)
	time=$(echo $line | cut -d " " -f 4 | cut -d ":" -f 2,3,4 --output-delimiter ":")
	page=$(echo $line | cut -d " " -f 7)
	if [[ "$page" == "/" ]]; then
		page="Homepage"
	fi
	agent=$(echo $line | grep -o 'Firefox\|Safari\|Chrome\|Edge\|curl')

	
	printf "\t\t\t\t<td>%s</td>\n" $ip >> accessLogs.html
	printf "\t\t\t\t<td>%s</td>\n" $time >> accessLogs.html
	printf "\t\t\t\t<td>%s</td>\n" $page >> accessLogs.html
	printf "\t\t\t\t<td>%s</td>\n" $agent >> accessLogs.html
	
	printf "\t\t\t</tr>\n" >> accessLogs.html

done < accessLog.txt

printf "\t\t</table>\n\t</body>\n</html>" >> accessLogs.html
