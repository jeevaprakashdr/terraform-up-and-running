output "user_arn" {
  value = aws_iam_user.users[*].arn
}

output "user_data" {
  value = aws_iam_user.users
}