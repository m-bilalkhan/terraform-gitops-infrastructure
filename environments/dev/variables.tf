variable "environment_name" {
  type        = string
  description = "Name of the environment, used for naming resources"
}

variable "env" {
  type        = string
  description = "environment"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets for the VPC"
}