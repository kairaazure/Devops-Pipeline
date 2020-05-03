variable "ami_id" {
  description = "jenkins master ami"
  default = "ami-0323c3dd2da7fb37d"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "learningaws"
}
variable "vpc_SG" {
   description = "A list of security group IDs to associate with"
   type        = list(string)
   default     = null
}
variable "subnet_id" {
   description = "Subnet ID of vpc"
   default     = null
}

variable "Nameec2" {

}
