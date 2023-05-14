module "module_iam_role_hub" {
        source = "./modules/iam-role/iam-role-hub"
        name = "${var.instance_name}"
}

module "module_iam_role_gw" {
        source = "./modules/iam-role/iam-role-gw"
}


module "instance_module_Hub" {

        source = "./modules/instance"
        ami = "${var.ami}"
        instance_type = "${var.instance_type}"
        instance_name = "${var.instance_name} Ec2 from TF local module"
        iam_role = "${module.module_iam_role_hub.output_name}"

} 



