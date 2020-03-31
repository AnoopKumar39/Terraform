data "aws_vpcs" "demo" {
  tags = {
    name = "Sample"
  }
}

output "current_vpc" {
  value = "${data.aws_vpcs.demo.ids}"
}
