resource "aws_instance" "ec2-instance" {
    ami = "ami-0715c1897453cabd1"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro" 
}