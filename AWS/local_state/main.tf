terraform {
    required_providers {
        aws = {
           source = "hashicorp/aws"
           version = "~> 4.67"
        }
    }   
 
  required_version = ">= 1.2.0"
}

provider "aws" {
    region = "ap-south-1"  # Set your desired AWS region
}

data "aws_ami" "amazon_linux" {

    most_recent = true
    owners = ["amazon"]

    filter{
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "example" {
    ami = data.aws_ami.amazon_linux.ID  # Specify an appropriate AMI ID
    instance_type = "t2.micro"

    tags = {
        Name = "TF_demo"
    }
}