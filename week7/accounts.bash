function help (){
	echo "-------------------------"
	echo "Syntax: bash $0 [- c/d/h]"
	echo " "
	echo "Options:"
	echo "-c List logins of a user"
	echo "-d List disabled accounts"
	echo "-h Print help"
	echo "-------------------------"
	exit
}

if [[ $# -eq 0 ]]; then
	help
fi

###################################################

while getopts "cd" option; do
	case "${option}" in
	c) #List logins
	numLogins=$(cat usr.txt | last | grep . -c)
	echo $numLogins logins
	;;

	d) #List disabled accounts
	grep ":\*:" /etc/shadow | cut -d ":" -f 1
	;;

	*)
	help
	;;
	esac
done
