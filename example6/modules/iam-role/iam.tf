resource "aws_iam_policy" "sts_assume_policy" {
  name        = "sts-assume-policy"
  description = "An example IAM policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "*"
        }
    ]
}
EOF
}





resource "aws_iam_role" "assume_role" {
  name = "assume-role-gw"

}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  role       = aws_iam_role.assume_role.name
  policy_arn = aws_iam_policy.sts_assume_policy.arn
}



output "output_name" {
  value = aws_iam_role.assume_role.name

}