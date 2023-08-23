terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key

  assume_role {
    role_arn = "arn:aws:iam::148482153770:role/sandbox-terraform-role"
  }

  default_tags {
    tags = {
      Environment = var.environment
      Project     = local.project
      ManagedBy   = "Terraform"
      Region      = var.region
    }
  }
}