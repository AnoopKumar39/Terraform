resource "aws_db_parameter_group" "default" {
  name          = "mariadb-10-3-pg"
  family        = "mariadb10.3"
}

resource "aws_db_subnet_group" "default" {
  name          = "main"
  subnet_ids    = "${var.PRIVATE_SUBNETS}"

  tags = {
    Name        = "${var.VPC_NAME}-Subnet-Group"
  }
}

