#!/bin/bash
sudo hostnamectl set-hostname $(new_hostname) &&
sudo yum install -y git &&
sudo yum install -y jenkins &&
sudo yum install -y docker &&
sudo yum install -y helm &&
echo "alias kc='kubectl'" >> ~/.bashrc &&
echo "alias kcclient='aws eks update-kubeconfig --name et-eks-01 --region us-east-2'" >> ~/.bashrc