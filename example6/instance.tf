


module "instance_module" {
        source = "./modules/instance"
        ami =  "ami-04ddf30efb5385f92"
        instance_type = "t2.nano"
        instance_name = "test"
} 


