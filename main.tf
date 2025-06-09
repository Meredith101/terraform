terraform {
  required_version = ">= 1.2.0"

  backend "s3" {
    bucket = "meredith-bucket"
    key    = "terraform/state/terraform.tfstate"
    region = "eu-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "sams-terraform-project" {
  ami           = "ami-0cfd0973db26b893b" 
  instance_type = "t2.micro"

  tags = {
    Name = "sams-terraform-project"
  }
}
