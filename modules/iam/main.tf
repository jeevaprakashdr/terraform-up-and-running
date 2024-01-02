resource "aws_iam_user" "examples" {
  for_each = toset(var.user_names)
  name = each.value
}