provider "aws" {

region     = "ap-southeast-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "vm-web" {
  ami           = "ami-04ddf30efb5385f93"
  instance_type = "t2.micro"
}