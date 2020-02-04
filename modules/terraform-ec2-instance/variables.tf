variable "ami_id" {
  description = "jenkins master ami"
  default = "ami-0ee7668baa64c93dc"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "learningaws"
}
variable "vpc_SG" {
  default = ""
}
variable subnet_id {
  default = ""
}