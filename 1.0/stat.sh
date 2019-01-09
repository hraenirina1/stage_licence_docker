top -bn 1 -d 1 | grep '^KiB Mem' |awk '{print $4 "\n" $6 "\n" $8}' > /stat.log
top -bn 1 -d 1 | grep '^%Cpu' |awk '{print $4 "\n" $6 "\n" $8}' >> /stat.log
df | grep '/' | awk '{print $1 "\n" $5}' >> /stat.log
pkill -fx 'nc -k -l 1234'
nc -k -c 'cat /stat.log' -l 1234
