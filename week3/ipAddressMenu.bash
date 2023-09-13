userInput=""

while :
do
	echo "Please select an option:"
	echo "1-Get my ip address"
	echo "2-Get my ip address in binary"
	echo "3-Get my network mask in binary"
	echo "4-Get my network address in binary"
	echo "5-Convert a binary address to an ip address"
	echo "6-Quit"

	read userInput

	if [[ "$userInput" == "1" ]]; then
		echo $(bash ../week2/ipAddress.bash)
	elif [[ "$userInput" == "2" ]]; then
		echo $(bash binaryIpAddress.bash)
	elif [[ "$userInput" == "3" ]]; then
                echo $(bash binarySubnetMask.bash)
	elif [[ "$userInput" == "4" ]]; then
                echo $(bash binaryNetworkAddress.bash)
	elif [[ "$userInput" == "5" ]]; then
		echo "Enter a binary address (32 digits)"
		read userInput

		echo $(bash convBinaryIpToAddress.bash $userInput)
	elif [[ "$userInput" == "6" ]]; then
                break
	else
		echo "Please enter a valid option"
	fi

	echo ""
done
