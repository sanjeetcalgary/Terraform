terraform {
  required_version = "~> v1.3.0" # terraform version
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0" # aws version
    }
  }
  # backend config- only 1 backend allowed , can be 
  # local, remote , http, S3 , kubernetes etc.
  backend "s3" {
    bucket = "bucket-name" # this should have been configured in AWS before using it
    key = "path of data in S3"
    region = "aws-region"
  }

  # Metadata for providers
  provider_meta "my-provider" { # my-provider= local name
    hello = "world"   
  }


}