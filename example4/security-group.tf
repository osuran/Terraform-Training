data "aws_ip_ranges" "asia_pacific_ec2" {
  regions  = ["ap-southeast-2"]
  services = ["ec2"]
}

resource "aws_security_group" "asia_pacific_sg" {
  name = "asia pacific allow"

  ingress {
    to_port          = "22"
    protocol         = "tcp"
    cidr_blocks      = data.aws_ip_ranges.asia_pacific_ec2.cidr_blocks
  }

}