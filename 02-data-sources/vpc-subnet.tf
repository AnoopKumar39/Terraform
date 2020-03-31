data "aws_vpcs" "demo" {
  tags = {
    name = "default"
  }
}

output "current_vpc" {
  value = "${data.aws_vpcs.demo.ids}"
}
