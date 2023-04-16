provider "aws" {

region     = "ap-southeast-1"
  access_key = "AKIA6QXXWRZILSVO74DF"
  secret_key = "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"
}

resource "aws_instance" "vm-web" {
  ami           = "ami-04ddf30efb5385f93"
  instance_type = "t2.micro"
}