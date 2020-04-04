resource "aws_vpc_peering_connection" "default-to-student" {
  peer_owner_id = "${var.ACCOUNT_ID}"
  peer_vpc_id   = "${aws_vpc.main.id}"
  vpc_id        = "${var.MGMT_VPC_ID}"
  auto_accept   = true

    tags = {
    Name = "VPC Peering between default and student"
  }
}