resource "aws_vpc" "devops_vpc" {
  cidr_block             = "${var.vpc_cidr}"
  instance_tenancy       = "default"

  tags                   = {
    Name                 = "Devops_Vpc"
  }
}
resource "aws_subnet" "devops_subnet-1" {
  availability_zone       = "${lenghth(var.AZ)}"
  vpc_id                  = "${aws_vpc.devops_vpc.id}"
  cidr_block              = "${var.subnet_cidr}"

  tags                    = {
    Name                  = "Devops_Subnet-1"
  }
}
