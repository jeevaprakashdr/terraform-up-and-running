output "user_arn" {
  value = values(aws_iam_user.examples)[*].arn
}