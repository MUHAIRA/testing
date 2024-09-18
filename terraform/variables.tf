// These variables will be consistent across environments and 
// can vary based on the environment you're deploying to.

variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "ap-southeast-1"
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t3.medium"
}

variable "environment" {
  description = "The environment name"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket for assets"
  type        = string
}
