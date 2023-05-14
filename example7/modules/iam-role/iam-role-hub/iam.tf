resource "aws_iam_role_policy" "sts_assume_policy" {
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
    }
  )

  tags = {
      Name = "${var.name} IAM Policy"
    }

}



resource "aws_iam_role" "assume_role" {
  name = "${var.name}_assume_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

}

resource "aws_iam_instance_profile" "iam_profile" {
  name = "${var.name}_profile"
  role = aws_iam_role.assume_role.name
}

output "output_name" {
  value = aws_iam_instance_profile.iam_profile.name

}