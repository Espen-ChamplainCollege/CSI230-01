ipAddrWithoutPrefix=$(bash ../week2/ipAddress.bash | cut -d "/" -f 1)
echo ${ipAddrWithoutPrefix}
