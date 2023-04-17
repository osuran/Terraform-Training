resource "aws_security_group" "sg_allow_ssh" {
  vpc_id      = aws_vpc.vpc.id
  name = "ssh allow"

  ingress {
    to_port          = "22"
    from_port        = "22"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}