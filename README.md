 # VPC and Cluster Role Setup for EKS on AWS

This repository contains Terraform code to set up a Virtual Private Cloud (VPC) and a cluster role for an Amazon Elastic Kubernetes Service (EKS) cluster. The VPC will have three public subnets and three private subnets, each in a different Availability Zone. The cluster role will allow the EKS service to assume the role and create the necessary resources in the VPC.

## Prerequisites

Before you begin, you will need the following:

* An AWS account
* The AWS CLI installed and configured