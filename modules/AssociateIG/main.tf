## Create the Internet Access

resource "aws_route" "terraform_VPC_internet_access" {
  route_table_id         = var.rt_id
  destination_cidr_block = var.internetip
  gateway_id             = var.gateway_id

}
