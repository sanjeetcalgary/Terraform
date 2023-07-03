# resource "<resource_type" "<local_name"
# unique identifier= resource_tye.local_name
resource "aws_instance" "web" {
  ami = "amiID"
  instance_type = "t2.micro"
  # meta-data like provider, dependes_on, lifecycle etc.
  timeouts {
    # allows you to customize how long certain operations are
    # allowed to take before being considered to have failed

  }
}
