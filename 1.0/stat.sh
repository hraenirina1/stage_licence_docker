top -bn 1 -d 1 | grep '^KiB Mem' |awk '{print $4 "\n" $6 "\n" $8}' > stat.log
top -bn 1 -d 1 | grep '^%Cpu' |awk '{print $4 "\n" $6 "\n" $8}' >> stat.log
df | grep '/' | awk '{print $1 "\n" $5}' >> stat.log
sudo pkill -fx 'nc -k -l 1234'
cat stat.log | nc -k -l 1234
