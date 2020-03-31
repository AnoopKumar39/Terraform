data "aws_vpcs" "demo" {
}

locals {
    vpc_ids = "${tolist(data.aws_vpcs.demo.ids)}"
    vpc_id  = "${element(local.vpc_ids,1)}"
}
output "current_vpc" {
  value = "${local.vpc_id}"
}

data "aws_subnet_ids" "demo" {
  vpc_id = "${local.vpc_id}"
}

output "all_subnets" {
    value = "${data.aws_subnet_ids.demo.ids}"
}


resource "aws_instance" "web" {
  ami           = "ami-0503db1a235b15e3f"
  instance_type = "t2.micro"
  subnet_id     = "${element(data.aws_subnet_ids.demo.ids,4)}"
