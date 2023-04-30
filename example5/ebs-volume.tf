
resource "aws_ebs_volume" "ebs-volume" {
  availability_zone = aws_instance.vm-terraform.availability_zone
  size              = 100
  delete_on_termination = true
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.ebs-volume.id
  instance_id = aws_instance.vm-terraform.id
}
