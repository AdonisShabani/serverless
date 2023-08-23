module "lambda_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = local.lambda_sg_name
  description = "Appstellar-Academt DVMS Lambda Security Group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [

  ]
  # ingress with source sg
  ingress_with_source_security_group_id = [
  ]
  # egress
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  # egress ipv6
  egress_with_ipv6_cidr_blocks = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      ipv6_cidr_blocks = "::/0"
    }
  ]

  tags = {
    Name = local.lambda_sg_name
  }
}

module "vpc_endpoint_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = local.vpc_endpoint_sg_name
  description = "Appstellar-Academy DVMS VPC endpoint Security Group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [

  ]
  # ingress with source sg
  ingress_with_source_security_group_id = [
    {
      description              = "Allow incoming traffic from lambda SG"
      from_port                = 0
      to_port                  = 0
      protocol                 = "-1"
      source_security_group_id = module.lambda_sg.security_group_id
    }

  ]
  # egress
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  # egress ipv6
  egress_with_ipv6_cidr_blocks = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      ipv6_cidr_blocks = "::/0"
    }

  ]

  tags = {
    Name = local.vpc_endpoint_sg_name
  }
}
