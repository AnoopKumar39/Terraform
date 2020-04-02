output "PRIVATE_SUBNETS" {
  value = "${aws_subnet.private_subnets.*.id}"
}
