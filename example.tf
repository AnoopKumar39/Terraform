provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_key_pair" "example" {
  key_name   = "devops2"
  public_key = file("~/.ssh/devops.pub")
}

resource "aws_instance" "example" {
  key_name      = aws_key_pair.example.key_name
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"

  connection {
  type        = "ssh"
  user        = "ec2-user"
  private_key = file("~/.ssh/devops")
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
