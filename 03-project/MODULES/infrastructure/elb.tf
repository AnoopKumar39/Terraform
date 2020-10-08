resource "aws_elb" "bar" {
  name                        = "${var.VPC_NAME}-asg-elb"
  subnets                     = "${var.PUBLIC_SUBNETS}"
  security_groups             = ["${aws_security_group.allow_web.id}"]

  listener {    
    instance_port             = 80
    instance_protocol         = "http"
    lb_port                   = 80
    lb_protocol               = "http"
  }   

  health_check {    
    healthy_threshold         = 2
    unhealthy_threshold       = 2
    timeout                   = 3
    target                    = "HTTP:80/"
    interval                  = 5
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name                      = "${var.VPC_NAME}-asg-elb"
  }
}
####resource "aws_elb" "bar" {
