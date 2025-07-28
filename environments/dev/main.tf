module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name = "${var.environment_name}-vpc"
  cidr = var.vpc_cidr_block

  azs             = var.availability_zones
  public_subnets  = var.public_subnets

  public_subnet_tags = {
    Name = "${var.environment_name}-public-subnet"
    Terraform   = "true"
    Environment = var.env
  }

  private_subnet_tags = {
    Name = "${var.environment_name}-private-subnet"
    Terraform   = "true"
    Environment = var.env
  }

  enable_dns_hostnames = true
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  igw_tags = {
    Name        = "${var.environment_name}-igw"
    Terraform   = "true"
    Environment = var.env
  }

  public_route_table_tags = {
    Name        = "${var.environment_name}-public-rtb"
    Terraform   = "true"
    Environment = var.env
  }

  tags = {
    Name        = "${var.environment_name}-vpc"
    Terraform   = "true"
    Environment = var.env
  }
}
