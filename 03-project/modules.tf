module "network" {
    source          = "./MODULES/vpc"
    VPC_CIDR        = "${var.PROJECT_CIDR}"
    VPC_NAME        = "${var.PROJECT_NAME}"
    AZ              = "${data.aws_availability_zones.available.names}"
}

module "database" {
    source          = "./MODULES/rds"
    #VPC_CIDR        = "${var.PROJECT_CIDR}"
    VPC_NAME        = "${var.PROJECT_NAME}"
    #AZ              = "${data.aws_availability_zones.available.names}"
    PRIVATE_SUBNETS = "${module.network.PRIVATE_SUBNETS}"
}