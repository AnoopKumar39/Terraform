data "template_file" "db-schema" {
  template = "${file("${path.module}/db-schema.sql")}"
  vars = {
    db_name = "${var.DBNAME}"
  }
}

resource "null_resource" "schema" {
  provisioner "local-exec" {
    command = "echo -e \"${data.template_file.db-schema.rendered}\" >> /tmp/db-schema.sql"
  }

  provisioner "local-exec" {
    command = "sudo yum install mariadb -y ; mysql -h ${aws_db_instance.studentapp-db.address} -u ${var.DBUSER} -p${var.DBPASS} < /tmp/db-schema.sql"
  }
}
