resource "aws_iam_user" "examples" {
  for_each = toset(var.user_names)
  name = each.value
}

data "aws_iam_policy_document" "cloudwatch_read_only" {
  statement {
    effect = "Allow"
    actions = [ 
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*"
     ]
     resources = [ "*" ]
  }
}

data "aws_iam_policy_document" "cloudwatch_full_access" {
  statement {
    effect = "Allow"
    actions = [ "cloudwatch:*" ]
    resources = [ "*" ]
  }
}

resource "aws_iam_policy" "cloudwatch_read_only" {
  name = "cloudwatch_read_only"
  policy = data.aws_iam_policy_document.cloudwatch_read_only.json
}

resource "aws_iam_policy" "cloudwatch_full_access" {
  name = "cloudwatch_full_access"
  policy = data.aws_iam_policy_document.cloudwatch_full_access.json
}

resource "aws_iam_user_policy_attachment" "kao_cloudwatch_read_only" {
  count = var.give_kao_full_access ? 0 : 1
  
  user = aws_iam_user.examples["kao"].name
  policy_arn = aws_iam_policy.cloudwatch_read_only.arn
}

resource "aws_iam_user_policy_attachment" "kao_cloudwatch_full_access" {
  count = var.give_kao_full_access ? 1 : 0 
  
  user = aws_iam_user.examples["kao"].name
  policy_arn = aws_iam_policy.cloudwatch_full_access.arn
}