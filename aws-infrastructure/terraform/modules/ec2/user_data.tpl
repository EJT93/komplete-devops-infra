#!/bin/bash
sudo hostnamectl set-hostname ${new_hostname} &&
sudo yum update -y &&
sudo yum install -y git &&

# Install Java (required for Jenkins)
sudo yum install -y java-11-amazon-corretto-headless &&

# Download and add the Jenkins repository to your yum repositories
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo &&
# Import the GPG key for the Jenkins repository to verify package integrity
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key &&


# Install Jenkins
sudo yum install -y jenkins &&

# Start and enable Jenkins service
sudo systemctl start jenkins &&
sudo systemctl enable jenkins &&

# Install Docker
sudo yum install -y docker &&

# Start and enable Docker service
sudo systemctl start docker &&
sudo systemctl enable docker &&

# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Setting up aliases
echo "alias kc='kubectl'" >> ~/.bashrc &&
echo "alias kcclient='aws eks update-kubeconfig --name et-eks-01 --region us-east-2'" >> ~/.bashrc