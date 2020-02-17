resource "aws_vpc" "devops_vpc" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "Devops_Vpc"
  }
}
resource "aws_subnet" "devops_subnets" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${aws_vpc.devops_vpc.id}"
  cidr_block = "${element(var.subnet_cidr, count.index)}"

  tags = {
    Name = "Devops_Subnet-${count.index+1}"
  }
}
