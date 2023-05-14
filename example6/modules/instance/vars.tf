variable "ami" {
  type          = string
  default       = "ami-0a306845f8cfbd41a"
}

variable "instance_type" {
  type          = string
  default       = "t2.micro"
}

variable "instance_name" {
  type          = string
  default       = "server name"
}

variable "key_name" {
  type          = string
  default       = "my-key"
}

