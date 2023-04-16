resource "aws_instance" "vm-terraform" {
  ami           = "${lookup(var.AMIs,var.AWS_REGION)}"
  instance_type = "t2.micro"
  output "ip" {
    value = "${aws_instance.vm-terraform.public_ip}"
  
  }

   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
}