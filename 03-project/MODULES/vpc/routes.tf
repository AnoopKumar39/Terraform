resource "aws_route_table" "public-rt" {
  vpc_id                = "${aws_vpc.main.id}"

  route {
    cidr_block          = "0.0.0.0/0"
    gateway_id          = "${aws_internet_gateway.igw.id}"
  }

  tags                = {
    Name                = "${var.VPC_NAME}-Public-RT"
  }

}


resource "aws_route_table_association" "public-rt" {
  count           = "${length(var.AZ)}"
  subnet_id       = "${element(aws_subnet.public_subnets.*.id, count.index)}"
  route_table_id  = "${aws_route_table.public-rt.id}"
}

