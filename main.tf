#Root Terraform

provider "aws" {
  version = "~> 2.0"
  region = var.region
}



module "vpc" {
  source = "./modules/terraform-vpc"
}

module "ec2" {
  source = "./modules/terraform-ec2-instance"
  vpc_SG = ["${module.vpc.vpc_SG1}"]
  subnet_id = "${module.vpc.public_subnet_id}"

}
