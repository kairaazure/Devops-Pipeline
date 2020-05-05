
resource "aws_instance" "jenkins_master" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_SG
  subnet_id              = var.subnet_id
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = false
  }
  tags =  {
    Name   = "var.Name"
    Author = "Kapil Bansal"
    Tool   = "Terraform"
  }
}
