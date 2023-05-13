resource "aws_iam_policy" "sts_assume_policy" {
  name        = "sts-assume-policy"
  role = aws_iam_role.assume_role.id

  policy = jsonencode(
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
})

}



resource "aws_iam_role" "assume_role" {
  name = "assume-role-gw"

}





output "output_name" {
  value = aws_iam_role.assume_role.name

}