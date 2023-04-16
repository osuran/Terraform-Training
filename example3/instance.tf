resource "aws_instance" "vm-terraform" {
  ami           = "${lookup(var.AMIs,var.AWS_REGION)}"
  instance_type = "t2.micro"

    provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
}
  output "ip" {
    value = "${aws_instance.vm-terraform.public_ip}"
  
  }

