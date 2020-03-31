data "aws_vpcs" "demo" {
}

locals {
    vpc_ids = "${tolist(data.aws_vpcs.demo.ids)}"
}
output "current_vpc" {
  value = "${local.vpc_ids}"
}
