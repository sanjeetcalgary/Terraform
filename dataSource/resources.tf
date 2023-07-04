resource "aws_instance" "myec2" {
  ami = data.aws_ami.ami_id.id
  instance_type = "t2.micro"
  user_data = file("script.sh")
  key_name = "kops-us-east-1"
  subnet_id = aws_subnet.my_public_subnet.id
  tags = {
    "res" = "output_variable"
    "type" = "JSON"
  }
  depends_on = [ aws_security_group.http-group, aws_security_group.ssh-group, aws_subnet.my_public_subnet, aws_subnet.my_private_subnet ]
  vpc_security_group_ids = [aws_security_group.http-group.id, aws_security_group.ssh-group.id]
}

resource "aws_vpc" "custom_vpc" {
  cidr_block = "172.50.0.0/16"
}

resource "aws_subnet" "my_public_subnet" {
  vpc_id = aws_vpc.custom_vpc.id
  cidr_block = "172.50.1.0/24"
  tags = {
    "type" = "Public-Subnet" 
  }
  depends_on = [ aws_vpc.custom_vpc ]
}

resource "aws_subnet" "my_private_subnet" {
  vpc_id = aws_vpc.custom_vpc.id
  cidr_block = "172.50.2.0/24"
  tags = {
    "type" = "Private-Subnet"
  }
  depends_on = [ aws_vpc.custom_vpc ]
}

resource "aws_security_group" "ssh-group" {
  name = "SSH-Group"
  description = "ssh group to connect remote"
  vpc_id = aws_vpc.custom_vpc.id
  ingress {
    from_port = 22
    to_port = 22
    description= "ssh"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0 
    to_port = 0
    description = "disable outgoing"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [ aws_vpc.custom_vpc ]
}

resource "aws_security_group" "http-group" {
  name = "HTTP-Group"
  description = "http group to connect remote"
  vpc_id = aws_vpc.custom_vpc.id
  ingress {
    from_port = 443
    to_port = 443
    description= "allow https"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    description= "allow http"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0 
    to_port = 0
    description = "allow outgoing"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   depends_on = [ aws_vpc.custom_vpc ]
}