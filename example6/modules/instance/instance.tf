resource "aws_instance" "vm-terraform" {
    ami           = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    iam_instance_profile = "${var.iam_role_name}"

    tags = {
      Name = "TF Ec2 - ${var.instance_name} "
    }
  
}


