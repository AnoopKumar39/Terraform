provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_key_pair" "example" {
  key_name   = "examplekey"
  public_key = file("/home/ec2-user/Terraform/terraform.pub")
}

resource "aws_instance" "example" {
  key_name      = aws_key_pair.example.key_name
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"

  connection {
  type        = "ssh"
  user        = "ec2-user"
  private_key = file("/home/ec2-user/Terraform/terraform")
  host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1.12",
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }
}