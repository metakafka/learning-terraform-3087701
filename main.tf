data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}
data "aws_vpc" "itop-dev-vpc" {
  id         = "vpc-0b549913b7f2aae58"
  cidr_block = "10.49.28.0/26"
  default    = false
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld"
  }
}
