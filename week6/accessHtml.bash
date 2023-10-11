bash createHtmlFromLogs.bash

mv accessLogs.html /var/www/html/accessLogs.html

ipAddr=$(bash ../week3/ipAddressWithoutPrefix.bash)

webAddress=$(echo http://$ipAddr/accessLogs.html)

firefox $webAddress
