variable "AWS_ACCESS_KEY"{}
variable "AWS_SECRET_KEY"{}
variable "AWS_REGION"{
    default = "ap-northeast-2"
}

variable "ami" {
  type          = string
  default       = "ami-0a306845f8cfbd41a"
}

variable "instance_type" {
  type          = string
  default       = "t2.micro"
}

variable "instance_name" {
  description   = "Value of the Name tag for the EC2 instance"
  type          = string
  default       = "sonar"
}

variable "key_name" {
  type          = string
  default       = "osura-seoul"
}

variable "iam_instance_profile"{
  type          = string
  default       = "dummy-role"
}

variable "name"{
  type          = string
  default       = "dummy-name"
}

variable "iam_role"{
  default ="Terraform_admin"
}