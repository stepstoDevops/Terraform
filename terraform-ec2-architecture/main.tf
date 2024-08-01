provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
  vpc_name = var.vpc_name
  subnet_count = var.subnet_count
  subnet_name = var.subnet_name
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
  name = var.security_group_name
}

module "ec2" {
  source            = "./modules/ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.security_groups.security_group_id
  instance_name     = var.instance_name
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "instance_public_ip" {
  value = module.ec2.public_ip
}
