resource "aws_iam_role" "assume_role" {
  name = "assume-role-gw"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
}
EOF



}

output "output_name" {
  value = aws_iam_role.assume_role.name

}