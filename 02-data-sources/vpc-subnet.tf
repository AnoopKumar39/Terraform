data "aws_vpcs" "demo" {
}

locals {
    vpc_ids = "${tolist(data.aws_vpcs.demo.ids)}"
    vpc_id  = "${element(local.vpc_ids,0)}"
}
output "current_vpc" {
  value = "${local.vpc_id}"
}
