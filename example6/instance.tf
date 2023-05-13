module "module_iam_role" {
        source = "./modules/iam-role"
}

module "instance_module_Hub" {
        source = "./modules/instance"
        ami = "${var.ami}"
        instance_type = "${var.instance_type}"
        instance_name = "${var.instance_name}"
        iam_role = "${module.module_iam_role.output_name}"

} 





