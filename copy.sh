#! /bin/bash
for i in $(cat names)
do
	scp -i ~/.aws/uw-bootcamp.pem $1 root@${i}:
done
