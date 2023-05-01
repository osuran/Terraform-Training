data "aws_ip_ranges" "asia_pacific_ec2" {
    regions  = ["ap-southeast-2"]
    services = ["ec2"]
}

data "aws_instances" "running_ec2s" {

    instance_state_names = ["running"]
}

output "ip" {
    value = "${data.aws_instances.running_ec2s.public_ips}"
  
  }

