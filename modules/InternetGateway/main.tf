# Create the Internet Gateway

resource "aws_internet_gateway" "awsIG" {
  vpc_id = aws_vpc.terraform_vpc.id
tags =  {
  Name = var.igname
}
}