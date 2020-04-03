resource "aws_placement_group" "application" {
  name     = "spread"
  strategy = "spread"
}


resource "aws_launch_configuration" "application-config" {
  name_prefix   = "terraform-lc-example"
  image_id      = "ami-00fa174a967f9222e"
  instance_type = "${var.INSTANCE_TYPE}"
}


resource "aws_autoscaling_group" "application" {
  name                      = "Studentapp-Asg"
  max_size                  = 5
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  placement_group           = "${aws_placement_group.application.id}"
  launch_configuration      = "${aws_launch_configuration.application-config.name}"
  vpc_zone_identifier       = "${var.PUBLIC_SUBNETS}"


 
  
}
