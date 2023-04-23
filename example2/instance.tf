resource "aws_instance" "vm-terraform" {
  ami           = "ami-0a306845f8cfbd41a"
  instance_type = "t2.micro"
}