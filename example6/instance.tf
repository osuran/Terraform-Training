module "module_iam_role_hub" {
        source = "./modules/iam-role/iam-role-hub"
}

module "module_iam_role_gw" {
        source = "./modules/iam-role/iam-role-hub"
}


module "instance_module_Hub" {

        source = "./modules/instance"
        ami = "${var.ami}"
        instance_type = "${var.instance_type}"
        instance_name = "${var.instance_name} Ec2 from TF local module"
        iam_role = "${module.module_iam_role_hub.output_name}"

} 


module "ec2_instance" {

        source  = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"
        name = "${var.instance_name} Ec2 from TF community module"
        instance_type          = "t2.micro"
        key_name               = "osura-seoul"
        iam_instance_profile = "${module.module_iam_role_gw.output_name}"
  
  }


