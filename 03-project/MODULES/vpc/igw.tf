resource "aws_internet_gateway" "igw" {
  vpc_id                = "${aws_vpc.main.id}"

  tags                  = {
    Name                = "${var.VPC_NAME}-IGW"
    "Created by"        = "Terraform"
    "Modified_Time"     = "${timestamp()}"
  }
}
