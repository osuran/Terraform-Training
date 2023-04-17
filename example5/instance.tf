resource "aws_instance" "vm-terraform" {
  ami           = "${lookup(var.AMIs,var.AWS_REGION)}"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id
  key_name = aws_key_pair.my-key.id

}


