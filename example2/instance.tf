resource "aws_instance" "vm-terraform" {
  ami           = "ami-04ddf30efb5385f93"
  instance_type = "t2.micro"
}