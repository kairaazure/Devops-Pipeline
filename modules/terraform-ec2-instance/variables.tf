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

}
variable "subnet_id" {
   description = "A list of security group IDs to associate with"
   type        = list(string)
   default     = null
}