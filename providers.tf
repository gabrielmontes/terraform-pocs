terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "5.17.0" }
  }

  backend "s3" {
    bucket = "gmontes-terraform-state"
    key    = "terraform/ec2-elb-sg"
    region = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-2"
}

