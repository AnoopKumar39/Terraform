provider "aws" {
}

terraform {
  backend "s3" {
    bucket = "akdevops-practice"
    key    = "states/terraform"
    region = "us-east-1"
  }
}
