#Root Terraform

provider "aws" {
  version = "~> 2.0"
  region = var.region
}



module "vpc" {
  source = "./modules/terraform-vpc"
  vpc_name = "vpc1"
  VpcCidrBlock = "172.168.0.0/16"
}

module "SecurityGroup" {
  source = "./modules/SecurityGroup"
  SG_CIDRblock = "171.61.166.24/32"
  sg_name = "SG1"
  vpc_id = "${module.vpc.vpc_id}"
}

module "ec2_public" {
  source = "./modules/terraform-ec2-instance"
  vpc_SG = ["${module.SecurityGroup.vpc_SG1}"]
  subnet_id = "${module.subnet_public.subnet_id}"
  Name = "ec2_Public"

}

module "ec2_private" {
  source = "./modules/terraform-ec2-instance"
  vpc_SG = ["${module.vpc.vpc_SG1}"]
  subnet_id = "${module.subnet_private.subnet_id}"
  Name = "ec2_Private"

}


module "subnet_public" {
  source = "./modules/subnet"
  vpc_id = "${module.vpc.vpc_id}"
  SubnetCidrBlock = "172.168.1.0/24"
  availabilityZone = "us-east-1a"
  mapPublicIP = true
  subnettype = "public"
  subnetname = "subnet1"

}

module "subnet_private" {
  source = "./modules/subnet"
  vpc_id = "${module.vpc.vpc_id}"
  SubnetCidrBlock = "172.168.2.0/24"
  availabilityZone = "us-east-1b"
  mapPublicIP = false
  subnettype = "private"
  subnetname = subnet2

}

module "route_table_public" {
  source = "./modules/Route-table"
  vpc_id = "${module.vpc.vpc_id}"
  RTname = "RT1"
  RTtype = "public"
}

module "route_table_private" {
  source = "./modules/Route-table"
  vpc_id = "${module.vpc.vpc_id}"
  RTname = "RT2"
  RTtype = "private"
}

module "ig" {
  source = "./modules/InternetGateway"
  igname = "ig1"
}

module "associate_ig_rt" {
  source = "./modules/AssociateIG"
  rt_id = "${module.route_table_public.rt_id}" 
  internetip = "0.0.0.0/0" 
  gateway_id = "${module.ig.ig_id}" 
}

module "associate_subnet_rt_public" {
  source = "./modules/RTSubnet"
  subnet_id = "${module.subnet_public.subnet_id}" 
  rt_id = "${module.route_table_public.rt_id}" 
}


module "associate_subnet_rt_private" {
  source = "./modules/RTSubnet"
  subnet_id = "${module.subnet_private.subnet_id}" 
  rt_id = "${module.route_table_private.rt_id}" 
}

module "nacl" {
  source = "./modules/Nacl"
  destinationCIDRblock = ""
  vpc_id = "${module.vpc.vpc_id}"
  subnet_id = "${module.subnet_public.subnet_id}"
  
}
