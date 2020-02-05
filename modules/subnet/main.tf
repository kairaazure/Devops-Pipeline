#Create  Subnet

locals {
subnettag = ${var.subnetname}_${var.subnettype}

}

resource "aws_subnet" "awssubnet" {
  vpc_id = var.vpc_id
  cidr_block = var.SubnetCidrBlock
  availability_zone = var.availabilityZone
  map_public_ip_on_launch = var.mapPublicIP
  
tags =  {
  Name = ${local.subnettag}

}

}
