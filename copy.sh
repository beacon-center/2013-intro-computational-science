#! /bin/bash
for i in $(cat names)
do
	scp -i ~/.aws/titus-courses.pem $1 root@${i}:
done
