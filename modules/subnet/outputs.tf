output "subnet_id" {
  description = "public subnet id of cloud created"
  value       = concat(aws_subnet.var.subnetname_var.subnettype.*.id, [""])[0]
  
}
