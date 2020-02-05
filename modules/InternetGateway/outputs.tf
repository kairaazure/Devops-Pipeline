output "ig_id" {
  description = "route table id of cloud created"
  value       = concat(aws_internet_gateway.${var.igname}.*.id, [""])[0]

}