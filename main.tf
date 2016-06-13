#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-99a58be2
#
# Your security group ID is:
#
#     sg-8e08dfe6
#
# Your AMI ID is:
#
#     ami-74ee001b
#
# Your Identity is:
#
#     hashiconf-37693cfc748049e45d87b8c7d8b9aacd
#
# Your AccessKeyID and SecretAccessKey are:
#
#     AKIAICQ3HPJA54G3WBJA
#     cpm7MTswNI1VxNEPw0Ojt4uwUdOGUf8aAFhB7Fey
#

variable "access_key" {} 
variable "secret_key" {}
variable "region" {
  default = "eu-central-1"
}


provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "web" {
  ami = "ami-74ee001b"
  instance_type = "t2.micro"

  subnet_id = "subnet-99a58be2"
  vpc_security_group_ids = [ "sg-8e08dfe6" ]

  count = "1"

  tags {
    Identity = "hashiconf-37693cfc748049e45d87b8c7d8b9aacd"
    Owner = "Rob klein Gunnewiek"
    Organization = "Bol.com"
  }
}

output "public_ip" {
  value = "${join(", ", aws_instance.web.*.public_ip)}"
}

output "public_dns" {
  value = "${join(", ", aws_instance.web.*.public_dns)}"
}

