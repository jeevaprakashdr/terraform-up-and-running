output "user_arn" {
    description = "The user arns for all the created users"
    value = module.users[*].user_arn
}