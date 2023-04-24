provider "aws" {

region     = "ap-northeast-2"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "vm-terraform" {
  ami           = "ami-0a306845f8cfbd41a"
  instance_type = "t2.micro"

  tags = {
    Name = "TF Ec2 - "
  }
}