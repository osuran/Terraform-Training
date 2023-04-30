resource "aws_instance" "vm-terraform" {
  ami           = "${lookup(var.AMIs,var.AWS_REGION)}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"

   tags = {
    Name = "TF Ec2 - ${var.instance_name} "
  }
  



}


