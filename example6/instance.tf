

module "instance_module" {

        source          = "./modules/instance"
        ami             = "${var.ami}"
        instance_type   = "${var.instance_type}"
        instance_name   = "${var.instance_name} Ec2 from TF local module"
        key_name        = "${var.key_name}"

} 


module "ec2_instance" {

        source          = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"
        name            = "${var.instance_name} Ec2 from TF community module"
        instance_type   = "t2.micro"
        key_name        = "${var.key_name}"
  
  }


