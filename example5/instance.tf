resource "aws_instance" "vm-terraform" {

  ami           = "${lookup(var.AMIs,var.AWS_REGION)}"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id
  key_name = aws_key_pair.my-key.id
  vpc_security_group_ids = [aws_security_group.sg_allow_ssh.id]
  availability_zone = data.aws_availability_zones.available.names[0]


  root_block_device {
    volume_size           = "50"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
}

data "aws_availability_zones" "available" {}

