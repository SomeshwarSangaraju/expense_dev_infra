resource "aws_instance" "frontend" {
  ami           = local.ami_id
  instance_type = "t3.micro"

  vpc_security_group_ids = [local.frontend_sg_id]
  subnet_id = local.private_subnet_ids

  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_suffix_name}-frontend"
    }
  )
}

resource "terraform_data" "frontend" {
  triggers_replace = [
   aws_instance.frontend.id
  ]

  connection {
    type        = "ssh"
    user        = "ec2-user" # Or "ubuntu", etc., depending on the AMI
    password = "DevOps321"
    host        = aws_instance.frontend.private_ip
  }
  provisioner "file" {
    source      = "frontend.sh" # Local path
    destination = "/tmp/frontend.sh"                  # Remote path
  }

  provisioner "remote-exec" {
    inline=[
        "chmod+x /tmp/frontend.sh",
        "sudo /tmp/frontend.sh frontend ${var.environment}"
    ]
  }
}

