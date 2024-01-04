IP=$(curl -s http://ifconfig.me)
echo "{\"cidr\": \"$IP/32\"}"