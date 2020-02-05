# Create the Route Table

resource "aws_route_table" "awsRT" {
 name = "var.RTname_var.RTtype"
 vpc_id = var.vpc_id

tags =  {
  Name = "var.RTname_var.RTtype"
}

}
