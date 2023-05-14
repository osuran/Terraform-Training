
provider "aws" {

  region     = "ap-northeast-2"
}

variable "NAME" {
    default = "Add Your Name"
}

variable project_tags{
  type = map(string)
  default = {
    Env = "Prod"
    Location = "Singapore"
  }
}

variable "ftp_dns_ports" {
  type = list(string)
  default = ["53","21"]
}

resource "aws_security_group" "ftp_dns_sg" {

  for_each = toset(var.ftp_dns_ports)
  name = "port ${each.value} allow ${var.NAME}"



  ingress {
      to_port          = "${each.value}"
      from_port          = "${each.value}"
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

    }

  tags = {

    for key, value in var.project_tags : key => value
  }
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

    for key, value in var.project_tags : key => value
  }
}

