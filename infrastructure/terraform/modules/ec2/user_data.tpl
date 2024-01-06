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
sudo curl -fsSL -o /opt/get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 &&
chmod 700 /opt/get_helm.sh &&
sh /opt/get_helm.sh &&

# Install kubectl
curl -o /opt/kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.25.15/2023-11-14/bin/linux/amd64/kubectl &&
chmod +x /opt/kubectl &&
mkdir -p $HOME/bin && cp /opt/kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH &&

# Setting up aliases
echo "alias kc='kubectl'" >> ~/.bashrc &&
echo "alias kcclient='aws eks update-kubeconfig --name et-eks-01 --region us-east-2'" >> ~/.bashrc &&

source ~/.bashrc && aws eks update-kubeconfig --name et-eks-01 --region us-east-2 &&

# Add GitHub's SSH key to known_hosts to avoid manual verification
ssh-keyscan -H id_rsa >> ~/.ssh/known_hosts &&

mkdir -p $HOME/repos && cd $HOME/repos && git clone git@github.com:EJT93/et-microservices-project.git