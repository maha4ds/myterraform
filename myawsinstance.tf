
# varibles
variable "region" {
    default = "us-west-2"
}
variable "access_key" {
    default = "AKIA55D7LGUS4NSGEK4T"
}
variable "secret_key" {
    default = "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"
}

variable "myamiid" {
        default = "ami-083ac7c7ecf9bb9b0"
}

variable "instancetype" {
        default = "t2.micro"
}

variable "keyname" {
        default = "mahaoOregon123"
}



# provider

provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

# Reosources
resource "aws_instance" "myawsintance" {
  ami           = "${var.myamiid}"
  instance_type = "${var.instancetype}"
  key_name      = "${var.keyname}"

  tags = {
    Name = "myawsinstance"
  }
}


# output

output "instance_public_dns" {
  value = "${aws_instance.myawsintance.public_dns}"
}



