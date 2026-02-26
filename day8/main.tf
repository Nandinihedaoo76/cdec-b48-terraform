## Terraform Provisioners
# special blocks to execute post-apply operations
# remote, local, file
# remote - used to execute command remote resource
# local - used to execute command local
# file - file copy host to remote resource

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my_instance" {
    ami = "ami-0c1fe732b5494dc14"
    instance_type = "t3.micro"
    key_name = "new-key"
    vpc_security_group_ids = ["sg-07316d011e1dec8ce"]
    tags = {
        Name = "my_instance"
        env = "dev"
    }

    provisioner "local-exec" {
        command = "echo 'Hello world' > index.html"
    }

    connection {
        type     = "ssh"
        user     = "ec2-user"
        host     = aws_instance.my_instance.public_ip
        private_key = file("new-key.pem")
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install httpd",
            "sudo systemctl start httpd",
            "sudo systemctl enable httpd"
        ]
    }

    provisioner "file" {
        source = "index.html"
        destination = "/var/www/html/index.html"
    }
}


# terraform taint"

# terraform import"




