provider "aws" {
  region = var.region
}

resource "aws_instance" "vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }

  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.vm_sg.id]
  subnet_id              = var.subnet_id

  associate_public_ip_address = var.associate_public_ip_address

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > public_ip.txt"
  }
}

resource "aws_security_group" "vm_sg" {
  name        = var.sg_name
  description = "Security group for VM"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr_blocks
  }

  ingress {
    from_port   = var.custom_port
    to_port     = var.custom_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_custom_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.public_key
}
