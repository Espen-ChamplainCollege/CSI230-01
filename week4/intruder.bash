ipDir=$1"/helloworld.html"
accessCounter=0

for i in $(seq 1 20)
do
	junkOutput=$(curl -s $ipDir)
	(( accessCounter+=1 ))
done

echo $accessCounter
