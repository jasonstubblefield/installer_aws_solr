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
  region = var.aws_region
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = [data.aws_security_group.selected.id]
  subnet_id              = var.subnet_id
  key_name               = var.key_name

  root_block_device {
    volume_size = var.root_block_device_size
    delete_on_termination = true
  }
}

data "aws_security_group" "selected" {
  id = var.security_group_id
}
