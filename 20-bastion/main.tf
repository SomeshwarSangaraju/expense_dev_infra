resource "aws_instance" "main" {
  for_each = var.instances
  ami           = local.ami
  instance_type = each.value
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id = local.public_subnet_ids

  # provisioner "local-exec" {
  #   command = "echo The server's IP address is ${self.private_ip} > inventory"
  # }

  #   connection {
  #       type     = "ssh"
  #       user     = "ec2-user"
  #       password = "DevOps321"
  #       host     = self.public_ip
  #   }

  #   provisioner "remote-exec" {
  #       inline = [
  #       "sudo dnf install nginx -y",
  #       "sudo systemctl start nginx"
  #       ]
  #   }

  #   provisioner "remote-exec" {
  #     inline = [
  #       "sudo systemctl stop nginx",
  #       "echo 'successfully stopped nginx server' "
  #     ]
  #     when = destroy
  #   }
  
  user_data = "bastion.sh"
  tags = merge(
    local.tags,
    {
        Name = each.key
        Terraform = "true"
    }
  ) 
}



