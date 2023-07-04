output "ec2_ip" {
  description = "IP of ec2"
  value = "Public ip=${aws_instance.myec2.public_ip}"
}

output "ec2_id" {
  description = "ID of ec2"
  value = "ID=${aws_instance.myec2.id}"
}





 