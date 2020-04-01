resource "aws_subnet" "public_subnets" {
  count                     = "${length(var.AZ)}"
  vpc_id                    = "${aws_vpc.main.id}"
  cidr_block                = "${cidrsubnet(var.VPC_CIDR, 8, count.index)}"
  availability_zone         = "${element(var.AZ, count.index)}"


  tags                      = {
    Name                    = "${var.VPC_NAME}-Public-Subnet-${count.index+1}"
    "Created by"            = "Terraform"
    "Modified_Time"         = "${timestamp()}"
  }
}

resource "aws_subnet" "private_subnets" {
  count                     = "${length(var.AZ)}"
  vpc_id                    = "${aws_vpc.main.id}"
  cidr_block                = "${cidrsubnet(var.VPC_CIDR, 8, count.index+6)}"
  availability_zone         = "${element(var.AZ, count.index)}"


  tags                      = {
    Name                    = "${var.VPC_NAME}-Private-Subnet-${count.index+1}"
    "Created by"            = "Terraform"
    "Modified_Time"         = "${timestamp()}"
  }
}
