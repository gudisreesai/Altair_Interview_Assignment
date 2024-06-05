To use this module, you would create a separate Terraform         configuration that calls this module. An example looks like this.

module "aws_vm" {
  source = "./terraform-aws-vm"

  region                    = "us-west-2"
  ami_id                    = "ami-0abcdef1234567890"
  instance_type             = "t2.large"
  instance_name             = "my-vm"
  key_name                  = "my-key-pair"
  public_key                = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD..."
  subnet_id                 = "subnet-0123456789abcdef0"
  sg_name                   = "my-vm-sg"
  allowed_ssh_cidr_blocks   = ["0.0.0.0/0"]
  allowed_custom_cidr_blocks = ["0.0.0.0/0"]
  custom_port               = 8080
  associate_public_ip_address = true
}

output "vm_instance_id" {
  value = module.aws_vm.instance_id
}

output "vm_public_ip" {
  value = module.aws_vm.public_ip
}

output "vm_public_dns" {
  value = module.aws_vm.public_dns
}


Note: Replace the placeholder values with the actual values for your AWS environment. This Terraform configuration will create an EC2 instance with the specified parameters and a security group allowing SSH and custom port access.