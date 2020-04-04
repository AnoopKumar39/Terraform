module "network" {
    source          = "./MODULES/vpc"
    VPC_CIDR        = "${var.PROJECT_CIDR}"
    VPC_NAME        = "${var.PROJECT_NAME}"
    AZ              = "${data.aws_availability_zones.available.names}"
    MGMT_VPC_ID     = "${var.MGMT_VPC_ID}"
    ACCOUNT_ID      = "${data.aws_caller_identity.current.account_id}"
    MGMT_VPC_CIDR   = "${var.MGMT_VPC_CIDR}"
}

module "database" {
    source          = "./MODULES/rds"
    VPC_CIDR        = "${var.PROJECT_CIDR}"
    VPC_NAME        = "${var.PROJECT_NAME}"
    #AZ              = "${data.aws_availability_zones.available.names}"
    PRIVATE_SUBNETS = "${module.network.PRIVATE_SUBNETS}"
    VPC_ID        = "${module.network.VPC_ID}"
    DBNAME          = "${var.DBNAME}"
    DBUSER          = "${var.DBUSER}"
    DBPASS          = "${var.DBPASS}"
    MGMT_VPC_CIDR   = "${var.MGMT_VPC_CIDR}"
}

module "infrastructure" {
    source          = "./MODULES/infrastructure"
    INSTANCE_TYPE   = "${var.INSTANCE_TYPE}"
    PUBLIC_SUBNETS = "${module.network.PUBLIC_SUBNETS}"
    VPC_ID        = "${module.network.VPC_ID}"
    VPC_NAME        = "${var.PROJECT_NAME}"
    GITUSER         = "${var.GITUSER}"
    GITPASS         = "${var.GITPASS}"
    DBHOST          = "${module.database.DBHOST}"


}