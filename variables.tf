variable "ami" {
  description = "The ID of the AMI to use for the EC2 instance"
  type        = string
}

variable "aws_key" {
  description = "The name of the AWS SSH key pair to use for EC2 instance access"
  type        = string
}

variable "region" {
  description = "The AWS region in which to deploy the resources"
  type        = string
  default     = "us-west-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

