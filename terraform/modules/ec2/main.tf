resource "aws_instance" "public_instance_1" {
    ami              = "ami-04b4f1a9cf54c11d0"
    instance_type    = "t2.micro"
    subnet_id        = var.public_subnet_1_id
    vpc_security_group_ids  = [var.security_group_id]
    tags = {
           Name      = "PublicInstance1"
    }
}

resource "aws_instance" "public_instance_2" {
    ami              = "ami-04b4f1a9cf54c11d0"
    instance_type    = "t2.micro"
    subnet_id        = var.public_subnet_2_id
    vpc_security_group_ids  = [var.security_group_id]
    tags = {
           Name      = "PublicInstance2"
    }
}