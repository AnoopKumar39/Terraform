data "aws_vpcs" "demo" {
}

output "current_vpc" {
  value = "${data.aws_vpcs.demo.ids}"
}
