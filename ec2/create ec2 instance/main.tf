terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
  }
}

variable "configmap" {
    default = {
      region = "us-east-1",
      ami = "ami-090fa75af13c156b4"
      instanceType= "t2.micro"
  }
    type = map(string)
}

provider "aws" {
  region = var.configmap.region
}

resource "aws_instance" "web" {
  ami           = var.configmap.ami
  instance_type = var.configmap.instanceType

  tags = {
    Name = "webserver"
  }
}