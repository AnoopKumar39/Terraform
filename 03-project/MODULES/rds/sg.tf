resource "aws_security_group" "allow_mariadb" {
  name        = "allow_mariadb"
  description = "Allow MariaDB internal traffic"
  vpc_id      = "${var.VPC_ID}"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${var.VPC_CIDR}", "${var.MGMT_VPC_CIDR}"]
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
