output "instance_ids" {
  value = aws_instance.instance[*].id
}

output "private_ips" {
  value = aws_instance.instance[*].private_ip
}
