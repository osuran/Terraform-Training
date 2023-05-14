
provider "aws" {

  region     = "ap-northeast-2"
}

variable "NAME" {
    default = "Add Your Name"
}

resource "aws_security_group" "http_sg" {
name = "http allow ${var.NAME}"


  dynamic ingress {
    for_each = [80,22,443]
    content{
          to_port          = ingress.value
          from_port        = ingress.value
          protocol         = "tcp"
          cidr_blocks      = ["0.0.0.0/0"]
    }

  }

  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.NAME}"
  }
}

