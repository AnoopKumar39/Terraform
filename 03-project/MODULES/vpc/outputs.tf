output "PRIVATE_SUBNETS" {
  value = "${aws_subnet.private_subnets.*.id}"
}

output "VPC_ID" {
    value = "${aws_vpc.main.id}"
}
