
resource "aws_ebs_volume" "ebs-volume" {
  #availability_zone = aws_instance.vm-terraform.availability_zone.id
  size              = 100
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/xvda"
  volume_id   = aws_ebs_volume.ebs-volume.id
  instance_id = aws_instance.vm-terraform.id
}