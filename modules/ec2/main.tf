resource "aws_instance" "instance" {

  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type

  vpc_security_group_ids = var.vpc_security_group_ids

  subnet_id              = var.private_subnet_ids[count.index % length(var.private_subnet_ids)]
  availability_zone      = var.availability_zones[count.index % length(var.availability_zones)]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.env}-instance-${count.index + 1}"
    }
  )
}