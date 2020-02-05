#Create  Subnet

resource "aws_subnet" "${var.subnetname}_${var.subnettype}" {
  vpc_id = aws_vpc.terraform_vpc.id   var.vpc_id
  cidr_block = var.SubnetCidrBlock
  availability_zone = var.availabilityZone
  map_public_ip_on_launch = var.mapPublicIP
  
tags =  {
  Name = "${var.subnetname}_${var.subnettype}"

}

}