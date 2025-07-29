variable "env" {
  description = "Environment"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with the EC2 instance"
  type        = list(string)
  default     = []
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}
