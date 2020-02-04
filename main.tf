#Root Terraform

provider "aws" {
  version = "~> 2.0"
  region = var.region
}



module "vpc" {
  source = "./modules/terraform-vpc"
  version                = "~> 2.0"


}

module "ec2" {
  source                 = "./modules/terraform-ec2-instance"
  version                = "~> 2.0"
  vpc_security_group_ids = module.vpc.vpc_SG1
  subnet_id              = module.vpc.public_subnet_id

}
