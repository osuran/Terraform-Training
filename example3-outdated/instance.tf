resource "aws_instance" "vm-terraform" {
  ami           = "${lookup(var.AMIs,var.AWS_REGION)}"
  instance_type = "t2.micro"
}