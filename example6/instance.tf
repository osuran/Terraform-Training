module "iam_role_name" {
        source = "./modules/iam-role"
}

module "instance_module_Hub" {
        source = "./modules/instance"
        ami = "${var.ami}"
        instance_type = "${var.instance_type}"
        instance_name = "${var.instance_name}"
        
  //  iam_instance_profile = iam_role_name.name

} 

module "instance_module_GW" {
        source = "./modules/instance"
        ami = "${var.ami}"
        instance_type = "${var.instance_type}"
        instance_name = "GW"
      //  iam_instance_profile = iam_role_name.name

} 

module "ec2_instance" {
  source  = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "osura-seoul"
 // iam_instance_profile = iam_role_name.name
  
  }


