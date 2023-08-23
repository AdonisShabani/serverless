variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key ID"
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS Secret Key"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "account" {
  type  = string
  default = null
}