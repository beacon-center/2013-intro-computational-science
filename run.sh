#! /bin/bash
for i in $(cat names)
do
	ssh -i ~/.aws/uw-bootcamp.pem root@${i} -f bash $1
done
