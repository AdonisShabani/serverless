data "terraform_remote_state" "networking" {
  backend = "remote"

  config = {
    workspaces   = { name = "networking" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}

data "aws_iam_policy_document" "lambda_access_policy" {

  statement {
    effect = "Allow"
    actions = [
      "s3:*"
    ]
    resources = [
      "*"
    ]
  }
}
