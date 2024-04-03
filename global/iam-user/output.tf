output "arns" {
  value = ["${aws_iam_user.poc-new-iam.*.arn}"]
}
