terraform {
  backend "remote" {
    workspaces { name = "networking" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}