output "user_arn" {
  value = values(aws_iam_user.examples)[*].arn
}

output "kao_cloudwatch_policy_arn" {
  value = one(concat(
    aws_iam_user_policy_attachment.kao_cloudwatch_full_access[*].policy_arn,
    aws_iam_user_policy_attachment.kao_cloudwatch_read_only[*].policy_arn
  ))
}