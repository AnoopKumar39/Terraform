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

locals {
    subnet_ids = "${tolist(data.aws_subnet_ids.demo.ids)}"
}

output "subnets_list" {
    value = "${local.subnet_ids}"
}

resource "aws_instance" "web" {
    ami           = "ami-0c322300a1dd5dc79"
    instance_type = "t2.micro"
    subnet_id     = "${element(local.subnet_ids,random_integer.subnet_pick.result)}"
}

resource "random_integer" "subnet_pick" {
  min     = 1
  max     = "${length(local.subnet_ids)}"
}

output "randon_number" {
  value = "${random_integer.subnet_pick.result}"
}


#######################################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
