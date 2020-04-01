module "network" {
    source          = "./MODULES/vpc"
    VPC_CIDR        = "${var.PROJECT_CIDR}"
    VPC_NAME        = "${var.PROJECT_NAME}"
    AZ              = "${data.aws_availability_zones.available.names}"
}