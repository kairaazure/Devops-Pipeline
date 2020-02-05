variable  "vpc_id" {
  default = null
}

variable "destinationCIDRblock" {
  default = "0.0.0.0/0"
}

variable "internetip" {
  default = "0.0.0.0/0"
}

variable "gateway_id" {
  default = null
}

variable "route_table_id" {
  default = null
}