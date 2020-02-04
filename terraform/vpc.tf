provider "aws" {
  version = "~> 2.0"
  region = var.region
}


#Create VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.VpcCidrBlock
  instance_tenancy = "default"
 

tags = {
  Name = "terraform_vpc"
 } 
}



#Create Public Subnet

resource "aws_subnet" "terraform_subnet_public" {

vpc_id = aws_vpc.terraform_vpc.id
cidr_block = var.SubnetCidrBlock
availability_zone = var.availabilityZone
map_public_ip_on_launch = var.mapPublicIP

tags {
  Name = "terraform_subnet_public"

 }
}
# Create Security Group

resource "aws_security_group" "terraform_SG1" {

  vpc_id       = aws_vpc.terraform_vpc.id
  name         = "Terraform VPC Security Group"
  description  = "Terraform VPC Security Group"
  
  ingress {
  
    cidr_blocks = var.SG_CIDRblock
    from_port = 22
    to_port = 22
    protocol = "tcp"	
	}

  egress {
  
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  
  
  }
  
  tags = {
   Name = "My VPC Security Group"
   Description = "My VPC Security Group"
}
	
}


# create VPC Network access control list
resource "aws_network_acl" "terraform_NACL" {
  vpc_id = aws_vpc.terraform_vpc.id
  subnet_ids = [ aws_subnet.terraform_subnet_public.id ]
# allow ingress port 22
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 22
    to_port    = 22
  }
  
  # allow ingress port 80 
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.destinationCIDRblock 
    from_port  = 80
    to_port    = 80
  }
  
  # allow ingress ephemeral ports 
  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 1024
    to_port    = 65535
  }
  
  # allow egress port 22 
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 22 
    to_port    = 22
  }
  
  # allow egress port 80 
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 80  
    to_port    = 80 
  }
 
  # allow egress ephemeral ports
  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 1024
    to_port    = 65535
  }
tags = {
    Name = "Terraform VPC ACL"
}
}

	
# Create the Internet Gateway

resource "aws_internet_gateway" "terraform_VPC_GW" {
 vpc_id = aws_vpc.terraform_vpc.id
 tags = {
        Name = "Terraform VPC Internet Gateway"
}
}

# Create the Route Table

resource "aws_route_table" "terraform_VPC_route_table" {
 vpc_id = aws_vpc.terraform_vpc.id
 tags = {
        Name = "Terraform VPC Route Table"
}
}




# Create the Internet Access

resource "aws_route" "terraform_VPC_internet_access" {
  route_table_id         = aws_route_table.terraform_VPC_route_table.id
  destination_cidr_block = var.internetip
  gateway_id             = aws_internet_gateway.terraform_VPC_GW.id
} # end resource


# Associate the Route Table with the Subnet

resource "aws_route_table_association" "terraform_VPC_association" {
  subnet_id      = aws_subnet.terraform_subnet_public.id
  route_table_id = aws_route_table.terraform_VPC_route_table.id
}