resource "aws_instance" "vm-terraform" {
    ami           = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name      = "${var.key_name}"
    
    tags = {
      Name = "${var.instance_name} "
    }
  
}


