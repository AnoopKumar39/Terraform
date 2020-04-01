resource "aws_subnet" "main" {
  vpc_id                    = "${aws_vpc.main.id}"
  cidr_block                = "10.0.1.0/24"
  availability_zone         = "${element(var.AZ, 1)}"


  tags                      = {
    Name                    = "Main"
  }
}
