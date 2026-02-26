provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "instance" {
    tags = {
        Name = "my_instance_1"
        env = "dev"
    }
    instance_type = "t3.small"
    ami = "ami-0c1fe732b5494dc14"

}