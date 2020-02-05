#Create VPC
resource "aws_vpc" "var.vpc_name" {
  cidr_block = var.VpcCidrBlock
  instance_tenancy = "default"

tags = {
  Name = "${var.vpc_name}"
  
}

}