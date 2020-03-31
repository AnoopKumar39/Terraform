data "aws_vpcs" "demo" {
}

output "current_vpc's" {
  value = "${data.aws_vpcs.demo.ids}"
}
