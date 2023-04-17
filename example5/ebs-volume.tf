
resource "aws_ebs_volume" "ebs-volume" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 100
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.ebs-volume.id
  instance_id = aws_instance.vm-terraform.id
}
