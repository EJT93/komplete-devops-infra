resource "aws_iam_instance_profile" "eks_access_role_instance_profile" {
  name = var.eks_access_role_instance_profile_name
  role = var.eks_access_role_instance_profile_role
}

resource "aws_key_pair" "name" {
  key_name = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "bastion-host" {
  ami                     = data.aws_ami.server_ami.id
  instance_type           = var.instance_type

  key_name                = aws_key_pair.name.id
  vpc_security_group_ids  = [data.aws_security_group.my-vpc-sg.id]
  subnet_id               = data.aws_subnet.my-vpc-subnet.id
  user_data = templatefile("../modules/ec2/user_data.tpl", {new_hostname = var.instance_name})
  iam_instance_profile    = aws_iam_instance_profile.eks_access_role_instance_profile.name

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_on_termination
  }
  
  tags = {
    Name                  = var.instance_name

  }

  provisioner "local-exec" {
    command               = "../modules/ec2/terraform_ssh_command.sh ${self.public_ip} ${var.private_key_path}"
  }
}