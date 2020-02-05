output "vpc_SG1" {
  value = concat(aws_security_group.awsSG.*.id, [""]) [0]
}