!/usr/bin/bash

cd /home/vagrant/memory_log
path=/home/vagrant/memory_log/mem_file.log
touch ram_file.log

midnight=$(date +%H%M)
EMAIL=email@gmail.com
USE=$(awk '/^Mem/ {print $3}' <(free -m))
sudo touch ${path}

date >> ${path}
echo "RAM usage: $USE" >> ${path}
echo "---" >>${path}

echo $midnight
if [[ "$midnight" == 0000 ]];
then
echo "RAM Usage for the day" | mail -s "RAM usage" ${EMAIL} -A ${path} && sudo rm -f ${path}
fi
