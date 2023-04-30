
resource "aws_ebs_volume" "ebs-volume" {
  availability_zone = aws_instance.vm-terraform.availability_zone
  size              = 100

   tags = {
    Name = "EBS Volume - ${var.NAME} "
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.ebs-volume.id
  instance_id = aws_instance.vm-terraform.id
}
