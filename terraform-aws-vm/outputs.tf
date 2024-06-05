output "instance_id" {
  description = "The ID of the deployed instance"
  value       = aws_instance.vm.id
}

output "public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.vm.public_ip
}

output "public_dns" {
  description = "The public DNS name of the instance"
  value       = aws_instance.vm.public_dns
}
