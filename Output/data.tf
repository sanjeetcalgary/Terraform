data "aws_ami" "ami_id" {
  most_recent = true
  owners = [ "amazon", "self" ]
  
    filter {
        name = "root-device-type"
        values = [ "ebs" ]
    }

    filter {
        name = "virtualization-type"
        values = [ "hvm" ]
    }

    filter {
        name = "architecture"
        values = [ "x86_64" ]
    }

}