output "vpc_id" {
  description = "vpc id of cloud created"
  value       = concat(aws_vpc.terraform_vpc.*.id, [""])[0]

}


output "public_subnet_id" {
  description = "public subnet id of cloud created"
  value       = concat(aws_subnet.terraform_subnet_public.*.id, [""])[0]
  
}

output "vpc_SG1" {
  value = concat(aws_security_group.terraform_SG1.*.id, [""]) [0]
}

output "private_subnet_id" {
  description = "public subnet id of cloud created"
  value       = concat(aws_subnet.terraform_subnet_public.*.id, [""])[0]
  
}