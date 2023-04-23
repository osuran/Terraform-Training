provider "aws" {

region     = "ap-northeast-2"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "vm-terraform" {
  ami           = "ami-04ddf30efb5385f93"
  instance_type = "t2.micro"
}