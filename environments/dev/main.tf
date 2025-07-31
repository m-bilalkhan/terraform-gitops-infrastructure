provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project_name}-${var.env}-vpc"
  cidr = var.vpc_cidr_block

  azs             = var.availability_zones
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  public_subnet_tags = {
    Name        = "${var.project_name}-${var.env}-public-subnet"
    Terraform   = "true"
    Environment = var.env
  }

  private_subnet_tags = {
    Name        = "${var.project_name}-${var.env}-private-subnet"
    Terraform   = "true"
    Environment = var.env
  }

  enable_dns_hostnames   = true
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = true
  create_egress_only_igw = true

  igw_tags = {
    Name        = "${var.project_name}-${var.env}-igw"
    Terraform   = "true"
    Environment = var.env
  }

  public_route_table_tags = {
    Name        = "${var.project_name}-${var.env}-public-rtb"
    Terraform   = "true"
    Environment = var.env
  }

  tags = {
    Name        = "${var.project_name}-${var.env}-vpc"
    Terraform   = "true"
    Environment = var.env
  }
}

module "s3_bucket" {
  source       = "../../modules/s3"
  bucket_name  = "${var.project_name}-${var.env}"
  env          = var.env
  project_name = var.project_name
}

resource "aws_security_group" "allow_all_outbound" {
  name        = "${var.project_name}-${var.env}-sg"
  description = "Allow all outbound traffic"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name        = "${var.project_name}-${var.env}-sg"
    Environment = var.env
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_egress" {
  security_group_id = aws_security_group.allow_all_outbound.id
  ip_protocol       = "-1" # All protocols
  from_port         = 0
  to_port           = 0
  cidr_ipv4         = "0.0.0.0/0" # Allow all outbound traffic
  tags = {
    Name        = "${var.project_name}-${var.env}-sg-egress"
    Environment = var.env
  }
}


data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

module "ec2_instance" {
  source = "../../modules/ec2"

  for_each               = toset(module.vpc.private_subnets)
  env                    = var.env
  project_name           = var.project_name
  ami_id                 = data.aws_ami.amzn-linux-2023-ami.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_all_outbound.id]
  subnet_id              = each.key
}

output "instance_public_ip" {
  value       = module.ec2_instance.instance_public_ip
  description = "Public IP of the EC2 instance"
}