output "subnet_id" {
  description = "public subnet id of cloud created"
  value       = concat(aws_subnet.awssubnet.*.id, [""])[0]
  
}
