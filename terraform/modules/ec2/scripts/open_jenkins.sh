#!/bin/bash

# First argument: Public IP address
jenkins_url="http://${1}:8080"

# Create the file for Mac
echo "open $jenkins_url" > mac_jenkins.txt
chmod +x mac_jenkins.txt

# Create the file for Windows
echo "start $jenkins_url" > windows_jenkins.bat
chmod +x windows_jenkins.bat
