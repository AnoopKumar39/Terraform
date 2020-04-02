resource "aws_db_instance" "studentapp-db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mariadb"
  engine_version       = "10.3"
  instance_class       = "db.t2.micro"
  name                 = "studentapp"
  username             = "student"
  password             = "student1"
  parameter_group_name = "${aws_db_parameter_group.default.id}"
  identifier           = "${lower(var.VPC_NAME)}-db"
  db_subnet_group_name = "${aws_db_subnet_group.default.id}"
  skip_final_snapshot  = true
}
