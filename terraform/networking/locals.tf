locals {
  project              = "Appstellar-Academy"
  vpc_name             = "my-vpc-${var.environment}"
  private_subnet_tags  = tomap({ "Tier" = "Private" })
  public_subnet_tags   = tomap({ "Tier" = "Public" })
  database_subnet_tags = tomap({ "Tier" = "Database" })
  lambda_sg_name       = format("%s-lambga-sg-%s", local.project, var.environment)
  vpc_endpoint_sg_name = format("%s-lambda-vpc-endpoint-%s", local.project, var.environment)
}
