logDir="/var/log/apache2/"
:> accessLog.txt

logList=$(ls $logDir | grep "access.log" | grep -v "other_vhosts" | grep -v "gz")

for log in $logList
do
	cat "$logDir$log" >> accessLog.txt
done
