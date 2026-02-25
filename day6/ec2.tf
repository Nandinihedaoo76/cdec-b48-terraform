# terraform {
#     backend "s3" {
#       region = "us-east-1"
#       bucket = "cdec-b48-tfstate"
#       key = "terraform.tfstate"
#     }
# }
provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my_instance" {
    ami = var.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = ["sg-07316d011e1dec8ce"]
    tags = {
        Name = "my_instance"
        env = var.env
    }
}




