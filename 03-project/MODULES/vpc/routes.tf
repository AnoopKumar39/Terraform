resource "aws_route_table" "public-rt" {
  vpc_id                = "${aws_vpc.main.id}"

  route {
    cidr_block          = "0.0.0.0/0"
    gateway_id          = "${aws_internet_gateway.igw.id}"
  }

  route {
    cidr_block                    = "${var.MGMT_VPC_CIDR}"
    vpc_peering_connection_id     = "${aws_vpc_peering_connection.default-to-student.id}"
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

resource "aws_route_table" "private-rt" {
  vpc_id          = "${aws_vpc.main.id}"

  route {
    cidr_block                    = "${var.MGMT_VPC_CIDR}"
    vpc_peering_connection_id     = "${aws_vpc_peering_connection.default-to-student.id}"
  }

  tags = {
    Name          = "${var.VPC_NAME}-Private-RT"
  }
}

resource "aws_route_table_association" "private-rt" {
  count           = "${length(var.AZ)}"
  subnet_id       = "${element(aws_subnet.private_subnets.*.id, count.index)}"
  route_table_id  = "${aws_route_table.private-rt.id}"
}

data "aws_route_tables" "rts" {
  vpc_id = "${var.MGMT_VPC_ID}"
}

locals {
  route_ids = "${tolist(data.aws_route_tables.rts.ids)}"
}

resource "aws_route" "r" {
  count                     = "${length(local.route_ids)}"
  route_table_id            = "${element(local.route_ids, count.index)}"
  destination_cidr_block    = "${var.VPC_CIDR}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.default-to-student.id}"
}
