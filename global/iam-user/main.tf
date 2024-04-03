data "aws_iam_policy_document" "poc_ec2_read_only" {
  statement {
    effect = "Allow"
    actions = ["ec2:Describe"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "poc_ec2_read_only" {
  name = "ec2-read-only"
  policy = data.aws_iam_policy_document.poc_ec2_read_only.json
}

resource "aws_iam_user_policy_attachment" "poc-ec2-attachment" {
  count = length(var.user_names)
  user  = element(var.user_names, count.index)
  policy_arn = aws_iam_policy.poc_ec2_read_only.arn
}

resource "aws_iam_user" "poc-new-iam" {
  count = length(var.user_names)
  name  = element(var.user_names, count.index)
}