provider "aws" {
  region  = "us-east-1"
  access_key = "AKIATTF66BRW65BTQGBW"
  secret_key = "+MEFG4QQ6/OaohVm8RsUUsNzSK6nRoTQuClQ51IR"
}
variable "count_instances" {
}

resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = "ami-00fa174a967f9222e"
  count         = "var.count_instances"
}
