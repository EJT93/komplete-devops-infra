resource "aws_iam_instance_profile" "eks_access_role_instance_profile" {
  name = var.eks_access_role_instance_profile_name
  role = var.eks_access_role_instance_profile_role
}


resource "aws_instance" "ec2" {
  ami                     = data.aws_ami.server_ami.id
  instance_type           = var.instance_type

  key_name                = var.key_name
  vpc_security_group_ids  = [data.aws_security_group.my-vpc-sg.id]
  subnet_id               = data.aws_subnet.my-vpc-subnet.id
  user_data = templatefile("../../modules/ec2/user_data.tpl", {new_hostname = var.instance_name})
  iam_instance_profile    = aws_iam_instance_profile.eks_access_role_instance_profile.name

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_on_termination
  }
  
  tags = {
    Name                  = var.instance_name

  }

# Execute the shell script allowing for immediate ssh access
  provisioner "local-exec" {
    command               = "../../modules/ec2/scripts/terraform_ssh_command.sh ${self.public_ip} ${var.private_key_path}"
  }

  # Execute the shell script to create and make executable open_jenkins files
  provisioner "local-exec" {
    command = "../../modules/ec2/scripts/open_jenkins.sh ${self.public_ip}"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"  # Replace with the appropriate user name
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
    # Using file provisioner to copy the SSH public key
  provisioner "file" {
    source      = var.github_key  # Replace with the path to your SSH public key
    destination = "/tmp/id_rsa"
  }

  # Using remote-exec to move the SSH key to /root/.ssh/ and set appropriate permissions
  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/id_rsa /root/.ssh/",
      "sudo chmod 600 /root/.ssh/id_rsa",
      "sudo chown root:root /root/.ssh/id_rsa"
    ]
  }
}