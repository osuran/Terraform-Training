resource "aws_instance" "vm-terraform" {
    ami           = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    iam_instance_profile = aws_iam_role.assume_role.name
    tags = {
      Name = "TF Ec2 - ${var.instance_name} "
    }
  
}


