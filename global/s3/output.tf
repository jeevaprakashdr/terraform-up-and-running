output "terraform_state_s3_bucket_arn" {
  value = aws_s3_bucket.terraform_state.arn
}

output "state_lock_dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
}