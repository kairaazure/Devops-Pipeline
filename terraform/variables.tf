variable  "VpcCidrBlock" {
   default = "192.168.0.0/16"
}

variable "SubnetCidrBlock" {
   default = "192.168.1.0/24"
}

variable "availabilityZone" {
   default = "us-east-1a"
}

variable "mapPublicIP" {
   default = true 
}

variable "SG_CIDRblock" {
   default = "122.162.206.189/32"
}

variable "destinationCIDRblock" {
   default = "122.162.206.189/32"
}

variable "internetip" {
   default = "0.0.0.0./0"
}

variable "region" {
   default = "us-east-1"
}