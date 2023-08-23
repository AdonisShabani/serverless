terraform {
  backend "remote" {
    workspaces { name = "serverless" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}