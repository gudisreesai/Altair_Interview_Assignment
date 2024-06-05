variable "region" {
  description = "The AWS region to deploy the VM"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The AMI ID for the VM"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the VM"
  type        = string
  default     = "t2.large"
}

variable "instance_name" {
  description = "The name tag for the VM"
  type        = string
}

variable "key_name" {
  description = "The key pair name for SSH access"
  type        = string
}

variable "public_key" {
  description = "The public key to use for SSH access"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to deploy the VM in"
  type        = string
}

variable "sg_name" {
  description = "The name of the security group"
  type        = string
  default     = "vm_sg"
}

variable "allowed_ssh_cidr_blocks" {
  description = "The CIDR blocks allowed to SSH to the VM"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_custom_cidr_blocks" {
  description = "The CIDR blocks allowed for custom port"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "custom_port" {
  description = "The custom port to allow traffic on"
  type        = number
  default     = 8080
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
  default     = true
}
