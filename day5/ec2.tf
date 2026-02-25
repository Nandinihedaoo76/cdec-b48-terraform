terraform {
    backend "s3" {
      region = "us-east-1"
      bucket = "cdec-b48-tfstate"
      key = "terraform.tfstate"
    }
}
provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my_instance" {
    ami = "ami-0c1fe732b5494dc14"
    instance_type = "t3.small"
    key_name = "new-key"
    vpc_security_group_ids = ["sg-07316d011e1dec8ce"]
    tags = {
        Name = "my_instance"
        env = "dev"
    }
}


