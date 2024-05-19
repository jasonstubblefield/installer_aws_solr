variable "aws_region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
  default     = "ami-058b428b3b45defec"
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t4g.small"
}

variable "security_group_id" {
  description = "The ID of the security group"
  type        = string
  default     = "sg-12345678"
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
  default     = "subnet-12345678"
}

variable "key_name" {
  description = "The name of the key pair"
  type        = string
  default     = "solr_ec2_key"
}

variable "instance_name" {
  description = "The name tag for the instance"
  type        = string
  default     = "SolrServerInstance"
}

variable "root_block_device_size" {
  description = "The size of the root EBS volume in GB"
  type        = number
  default     = 32
}

