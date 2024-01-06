# nodegroup.tf

resource "aws_eks_node_group" "frontend" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = var.frontend_node_group_name
  node_role_arn   = aws_iam_role.worker.arn
  capacity_type = var.capacity_type
  disk_size = var.disk_size
  instance_types = var.instance_types 
  remote_access {
    ec2_ssh_key = var.key_name
    source_security_group_ids = [data.terraform_remote_state.vpc.outputs.main_vpc_security_group_id]
  } 

  # taint {
  #   key = "frontend"
  #   value = "yes"
  #   effect = "NO_SCHEDULE"
  # }
  
  subnet_ids      = [data.terraform_remote_state.vpc.outputs.public_subnet1_id,
    data.terraform_remote_state.vpc.outputs.public_subnet2_id]

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = var.max_unavailable
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    data.terraform_remote_state.vpc
  ]
}

resource "aws_eks_node_group" "backend" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = var.backend_node_group_name
  node_role_arn   = aws_iam_role.worker.arn
  subnet_ids      = [data.terraform_remote_state.vpc.outputs.public_subnet1_id,
    data.terraform_remote_state.vpc.outputs.public_subnet2_id]
  capacity_type   = var.capacity_type
  disk_size       = var.disk_size
  instance_types  = var.instance_types 
  remote_access {
    ec2_ssh_key               = var.key_name
    source_security_group_ids = [data.terraform_remote_state.vpc.outputs.main_vpc_security_group_id]
  } 
  
  labels =  tomap({env = "dev"})
  
  scaling_config {
    desired_size  = var.desired_size
    max_size      = var.max_size
    min_size      = var.min_size
  }

  update_config {
    max_unavailable = var.max_unavailable
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    data.terraform_remote_state.vpc
  ]
}


