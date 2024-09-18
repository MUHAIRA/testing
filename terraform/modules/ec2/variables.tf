variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance"
  type        = string
}

variable "security_group_id" {
  description = "The security group to assign to the EC2 instance"
  type        = string
}

variable "environment" {
  description = "Environment variable"
  type        = string
}
