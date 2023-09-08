#script that runs ip addr and pipes the actual ip address to the display

baseIpAddr="$(ip addr)"
ipAddrs="$(echo "${baseIpAddr}" | grep 'inet ')"
echo ${ipAddrs} | awk '{print $7}'
