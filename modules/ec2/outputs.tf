output "instance_id" {
  value       = aws_instance.instance.id
  description = "The ID of the EC2 instance created by this module"
}

output "instance_public_ip" {
  value       = aws_instance.instance.public_ip
  description = "The public IP address of the EC2 instance"
}