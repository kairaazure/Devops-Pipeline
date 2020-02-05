#Create VPC
resource "aws_vpc" "awsvpc" {
  cidr_block = var.VpcCidrBlock
  instance_tenancy = "default"

tags = {
  Name = var.vpc_name
  
}

}