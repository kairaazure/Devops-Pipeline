# Create the Route Table

resource "aws_route_table" "awsRT" {
  vpc_id = var.vpc_id

tags =  {
  Name = "var.RTname_var.RTtype"
}

}
