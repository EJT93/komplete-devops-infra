# IP=$(curl -s http://ifconfig.me)
# echo "{\"cidr\": \"$IP/32\"}"

#!/bin/bash

# Fetch the public IPv4 address using an alternative service
IP=$(curl -s https://api.ipify.org)

# Check if the IP address was successfully retrieved
if [[ -z "$IP" ]]; then
    echo "Error: Unable to retrieve the public IP address."
    exit 1
else
    # Output the IP address in CIDR notation
    echo "{\"cidr\": \"$IP/32\"}"
fi
