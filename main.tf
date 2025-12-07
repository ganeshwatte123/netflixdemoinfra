provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0e6a50b0059fd2cc3"
  instance_type          = "t2.medium"
  key_name               = "GaneshDevops"
  vpc_security_group_ids = ["sg-04a64a0e326f5b47b"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
