resource "aws_placement_group" "application" {
  name     = "spread"
  strategy = "spread"
}


resource "aws_launch_configuration" "application-config" {
  name_prefix   = "terraform-lc-example"
  image_id      = "ami-00fa174a967f9222e"
  instance_type = "${var.INSTANCE_TYPE}"
  key_name      = "devops"
  security_groups = ["${aws_security_group.allow_ssh.id}", "${aws_security_group.allow_web.id}"]
  user_data        = <<EOF
#!/bin/bash
yum install ansible -y
ansible-pull -U https://${var.GITUSER}:${var.GITPASS}@github.com/AnoopKumar39/Ansible-Pull.git stack.yml -e DBHOST=${var.DBHOST}
EOF
}


resource "aws_autoscaling_group" "application" {
  name                      = "Studentapp-Asg"
  max_size                  = 5
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  force_delete              = true
  placement_group           = "${aws_placement_group.application.id}"
  launch_configuration      = "${aws_launch_configuration.application-config.name}"
  vpc_zone_identifier       = "${var.PUBLIC_SUBNETS}"
  load_balancers            = ["${aws_elb.bar.name}"]

  tags                      = [
    {
    key                     = "Name"
    value                   = "${var.VPC_NAME}-asg"
    propagate_at_launch     = true
    }
  ]

  
}

resource "aws_autoscaling_policy" "bat" {
  name                   = "foobar3-terraform-test"
  autoscaling_group_name = "${aws_autoscaling_group.application.name}"
policy_type = "TargetTrackingScaling"
target_tracking_configuration {
  predefined_metric_specification {
    predefined_metric_type = "ASGAverageCPUUtilization"
  }

  target_value = 40.0
}
}

