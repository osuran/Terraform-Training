resource "aws_instance" "vm-terraform" {
  ami           = "${lookup(var.AMIs,var.AWS_REGION)}"
  instance_type = "t2.micro"
  
  vpc_security_group_ids = ["${aws_security_group.asia_pacific_sg.id}"]

  userdata = file("./userdata.sh")

 tags = {
    Name = "TF Ec2 - "
  }
}


