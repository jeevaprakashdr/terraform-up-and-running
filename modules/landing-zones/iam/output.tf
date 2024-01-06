output "user_arns" {
  value = values(aws_iam_user.users)[*].arn
}