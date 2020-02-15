provider "aws" {
  region  = "us-east-1"
  access_key = "AKIATTF66BRW65BTQGBW"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = "${ami-00fa174a967f9222e}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}