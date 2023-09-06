#Script to create a wireguard server

#check if previous config file exists
if [[ -f "wg0.conf" ]]
then
	echo "Config file already exists, do you wish to overwrite? (y/N)"
	read toOverwrite

	if [[ "${toOverwrite}" == "y" ]]
	then
		echo "Creating wireguard configuration file."
	elif [[ "${toOverwrite}" == "N" ]]
	then
		echo "Exiting..."
		exit 0
	else
		echo "Error: Invalid value"
		exit 1
	fi
fi

#Create a private key
privateKey="$(wg genkey)"
echo "${privateKey}" > /etc/wireguard/server_private.key

#Create a public key
publicKey="$(echo ${privateKey} | wg pubkey)"
echo "${publicKey}" > /etc/wireguard/server_public.key

#Set the addresses
address="10.254.132.0/24"

#Set Server IP Addresses
serverAddress="10.254.132.1/24"

#Set a listening port
listeningPort="4282"

#Info to be used in client configuration
peerInfo="# ${address} 192.168.241.131:4282 ${publicKey} 8.8.8.8,1.1.1.1 1280 120 0.0.0.0/0"
# 1: #, 2: For obtaining an IP address for each client.
# 3: Server's actual IP address
# 4: clients will need server public key
# 5: dns information
# 6: determines the largest packet size allowed
# 7: keeping connection alive for
# 8: what traffic to be routed through VPN

echo "${peerInfo}
[Interface]
Address = ${serverAddress}
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o ens33 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o ens33 -j MASQUERADE
ListenPort = ${listeningPort}
PrivateKey = ${privateKey}
" > wg0.conf 
