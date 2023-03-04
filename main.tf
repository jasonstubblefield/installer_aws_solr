terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t3a.small"

  tags = {
    Name = "SolrServerInstance"
  }

  vpc_security_group_ids = [data.aws_security_group.selected.id]

  subnet_id = "subnet-a7407e8f"

  key_name = "ndxsinc"

}

data "aws_security_group" "selected" {
  id ="sg-08c6ad6d"
}