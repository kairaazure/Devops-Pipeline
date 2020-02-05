#Create  Subnet

resource "aws_subnet" "var.subnetname_var.subnettype" {
  vpc_id = var.vpc_id
  cidr_block = var.SubnetCidrBlock
  availability_zone = var.availabilityZone
  map_public_ip_on_launch = var.mapPublicIP
  
tags =  {
  Name = "var.subnetname_var.subnettype"

}

}
