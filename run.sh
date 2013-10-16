#! /bin/bash
for i in $(cat names)
do
	ssh -i ~/.aws/titus-courses.pem root@${i} -f bash $1
done
