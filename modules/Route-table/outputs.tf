output "rt_id" {
  description = "route table id of cloud created"
  value       = concat(aws_route_table.${var.RTname}_${var.RTtype}.*.id, [""])[0]

}