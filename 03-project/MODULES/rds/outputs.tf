output "DBHOST" {
  value = "${aws_db_instance.studentapp-db.address}"
}
