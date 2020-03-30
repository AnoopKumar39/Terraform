data "aws_vpcs" "default" {
}

output "aws_vpc" {
  value = "${data.aws_vpcs.default.ids}"
}
