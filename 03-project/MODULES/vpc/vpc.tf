resource "aws_vpc" "main" {
  cidr_block                = "${var.VPC_CIDR}"

    tags                    = {
    Name                    = "${var.VPC_NAME}"
    "Created by"            = "Terraform"
    "Modified_Time"         = "${timestamp()}" 


    }
}
#######resource "aws_vpc" "main" {
