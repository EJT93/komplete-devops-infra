#!/bin/bash

# First argument: Public IP address
# Second argument: Path to the SSH key file
output_file="./ssh.txt"

echo "ssh -i \"$2\" ec2-user@${1}" > "$output_file"

chmod +x "$output_file"
