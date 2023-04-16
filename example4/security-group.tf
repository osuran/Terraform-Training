data "aws_ip_ranges" "asia_pacific_ec2" {
  regions  = ["ap-south-1", "ap-northeast-1","ap-northeast-2", "ap-northeast-3", "ap-southeast-1", "ap-southeast-2"]
  services = ["ec2"]
}

resource "aws_security_group" "asia_pacific_sg" {
  name = "from_europe"

  ingress {
    from_port        = "443"
    to_port          = "443"
    protocol         = "tcp"
    cidr_blocks      = data.aws_ip_ranges.asia_pacific_ec2.cidr_blocks
  }

}