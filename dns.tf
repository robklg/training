#
# DO NOT DELETE THESE LINES!
#
# Your DNSimple email is:
#
#     sethvargo+terraform@gmail.com
#
# Your DNSimple token is:
#
#     1Gam3SE2eIwZYtq70H5V5iAXiE9sGPmf
#
# Your Identity is:
#
#     hashiconf-37693cfc748049e45d87b8c7d8b9aacd
#

provider "dnsimple" {
  token = "1Gam3SE2eIwZYtq70H5V5iAXiE9sGPmf"
  email = "sethvargo+terraform@gmail.com"
}

resource "dnsimple_record" "myrecord" {
  domain = "terraform.rocks"
  name = "robklg"
  value = "${aws_instance.web.1.public_ip}"
  type = "A"
  ttl = 3600
}
