

module "instance_module_1" {

        source          = "./modules/instance"
        ami             = "${var.ami}"
        instance_type   = "${var.instance_type}"
        instance_name   = "${var.instance_name} Ec2 from TF local module"
        key_name        = "${var.key_name}"

} 


module "instance_module_2" {

        source          = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"
        name            = "${var.instance_name} Ec2 from TF community module"
        instance_type   = "{var.instance_type}"
        key_name        = "${var.key_name}"
  
  }


