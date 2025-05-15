provider "aws" {
  alias  = "primary"
  region = "us-east-1"
}

provider "aws" {
  alias  = "secondary"
  region = "ap-southeast-1"
}

module "primary_vpc" {
  source              = "./modules/vpc_module"
  providers = {
    aws = aws.primary
  }
  vpc_cidr            = "10.0.0.0/16"
  subnet_cidr         = "10.0.1.0/24"
  az                  = "us-east-1a"
  name_prefix         = "primary"
  subnet_name         = "Global App Area 1-subnet-public1-us-east-1a"
  route_table_name    = "primary-public-rt"
  igw_name            = "primary-igw"
  subnet_association  = true
}

module "secondary_vpc" {
  source              = "./modules/vpc_module"
  providers = {
    aws = aws.secondary
  }
  vpc_cidr            = "10.0.0.0/24"
  subnet_cidr         = "10.0.0.0/26"
  az                  = "us-east-1f"
  name_prefix         = "secondary"
  subnet_name         = "Area 2 VPC - Subnet 1 - Public - us-east-1f"
  route_table_name    = "secondary-public-rt"
  igw_name            = "secondary-igw"
  subnet_association  = true
}

# Other resources remain unchanged (EC2, SG, CloudWatch, IAM, outputs)
