# Komplete DevOps Stack for EKS on AWS

This repository is a comprehensive DevOps stack designed to set up and manage Amazon Elastic Kubernetes Service (EKS) on AWS using Terraform, Ansible, and Jenkins. It includes configurations for creating a fully functional VPC, EKS cluster, a Bastion Host (EC2), DNS records (Route 53), and CI/CD workflows with Jenkins.

## Overview

The Terraform code in this repository will set up a Virtual Private Cloud (VPC) with three public and three private subnets, each distributed across different Availability Zones. Additionally, it includes a cluster role configuration for EKS, allowing the service to create and manage resources within the VPC.

## Prerequisites

Before getting started, ensure you have the following:

- An AWS account
- AWS CLI installed and configured
- Terraform installed
- Git and GitHub Account

## Directory Structure

- `infrastructure/`: Infrastructure as Code (IaC) for AWS resources.
  - `ansible/`: Ansible playbooks for configuration management.
    - `playbooks/grafana.yaml`: Setup Grafana using Ansible.
  - `terraform/`: Terraform modules and resources for AWS services.
    - `modules/`: Reusable modules for EC2, EKS, IAM, Route 53, and VPC.
    - `resources/`: Resource configurations using these modules.
- `jenkins/`: Jenkins configurations for CI/CD processes.
  - `jenkins/`: Setup and configuration files for Jenkins master.
  - `jenkins-agent-build/Dockerfile`: Dockerfile for Jenkins build agents.

## Infrastructure Setup

To set up the infrastructure using Terraform:

1. Navigate to `infrastructure/terraform/resources/<service>`.
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Apply the configurations:
   ```bash
   terraform apply
   ```

For configuring applications with Ansible:

1. Go to `infrastructure/ansible/playbooks/`.
2. Execute the playbook (e.g., Grafana):
   ```bash
   ansible-playbook grafana.yaml
   ```

## Jenkins CI/CD Setup

1. Apply Kubernetes manifests in `jenkins/jenkins/jenkins-master-pod/`.
2. Build the Jenkins agent Docker image using `jenkins/jenkins-agent-build/Dockerfile`.

## Contributing

Contributions are welcome to enhance and expand the functionalities of this DevOps stack. Please adhere to conventional Git workflows for contributions and keep the documentation up to date.