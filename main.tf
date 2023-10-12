module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "${var.env}-vpc"

  cidr = var.cidr
  azs  = var.aws_availability_zones

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = merge(
    var.additional_tags,
    {
      "Subnet" = "Public"
    }
  )

  private_subnet_tags = merge(
    var.additional_tags,
    {
      "Subnet" = "Private"
    }
  )
}