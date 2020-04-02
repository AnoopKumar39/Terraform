resource "aws_db_parameter_group" "default" {
  name          = "mariadb-10-3-pg"
  family        = "mariadb10.3"
}
