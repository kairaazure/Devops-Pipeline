output "vpc_SG1" {
  value = concat(aws_security_group."${var.sg_name}".*.id, [""]) [0]
}