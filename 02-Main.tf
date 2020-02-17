resource "aws_vpc" "devops_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags             = {
    Name           = "Devops_Vpc"
  }
}
resource "aws_subnet" "devops_subnet-1" {
  vpc_id           = "${aws_vpc.devops_vpc.id}"
  cidr_block       = "10.0.1.0/24"

  tags             = {
    Name           = "Devops_Subnet-1"
  }
}
