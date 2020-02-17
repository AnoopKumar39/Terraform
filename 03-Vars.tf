variable "vpc_region" {
  type = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

 variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "AZ" {
    type = list
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}