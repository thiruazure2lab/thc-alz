terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
backend "s3" {
  bucket = "thc-terraform-state"
  key = "terraform.tfstate"
  region = "eu-west-2"
  dynamodb_table = "thc-terraform-state-lock"
  encrypt = true
  profile = "default"
  shared_credentials_file = "/Users/username/.aws/credentials"
}
}

provider "aws" {
  region = "eu-west-2"
  profile = "default"
 }  
 



module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.66.0"
  name = "thc-vpc"
  cidr = "[10.0.0.0/16]"
  azs = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = ["prviatesubnet1", "prviatesubnet2", "prviatesubnet3"]
  public_subnets = ["publicsubnet1", "publicsubnet2", "publicsubnet3"]
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support = true
  public_subnet_tags = {
    Name = "Public"
  }
  private_subnet_tags = {
    Name = "Private"
  }
  vpc_tags = {
    Name = "thc-vpc"
  }
  
  tags = {
    "Terraform" = "true"
    "Environment" = "dev"
  }

}