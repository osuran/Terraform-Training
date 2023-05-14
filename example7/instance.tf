module "module_iam_role_hub" {
        source = "./modules/iam-role/iam-role-hub"
        name = "${var.instance_name}"
}

module "module_iam_role_gw" {
        source = "./modules/iam-role/iam-role-gw"
        name = "${var.instance_name}"
}

locals {
        server-type-local="${var.server-type}"
}
module "instance_module_Hub" {

        source = "./modules/instance"
        ami = "${var.ami}"
        instance_type = "${var.instance_type}"
        instance_name = "${var.server-type == "hub" ? "${var.instance_name} Hub Server" : "${var.instance_name} GW Server"}"
        iam_role = "${var.server-type == "hub" ? module.module_iam_role_hub.output_name: module.module_iam_role_gw.output_name}"

        server-type = "${var.server-type}"
        

} 

server-type-local="gw"

module "instance_module_gw" {

        
        source = "./modules/instance"
        server-type = "gw"
        ami = "${var.ami}"
        instance_type = "${var.instance_type}"
        instance_name = "${local.server-type-local == "hub" ? "${var.instance_name} Hub Server" : "${var.instance_name} GW Server"}"
        iam_role = "${local.server-type-local == "hub" ? module.module_iam_role_hub.output_name: module.module_iam_role_gw.output_name}"

  //      server-type = "${local.server-type-local} "
        

} 

