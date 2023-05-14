resource "aws_iam_instance_profile" "gw_profile" {
  name = "${var.name}-gw_profile"
  role = aws_iam_role.role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  name               = "${var.name}-gw_role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

output "output_name" {
  value = aws_iam_instance_profile.gw_profile.name

}