provider "aws" {
  region = var.aws_region
}

module "ec2" {
  source            = "testing/terraform/modules/ec2"
  ami_id            = "ami-0123456789abcdef0"
  instance_type     = var.instance_type
  security_group_id = module.security_group.security_group_id
  environment       = "production"
}

module "security_group" {
  source      = "testing/terraform/modules/security_group"
  environment = "production"
}

module "s3" {
  source      = "testing/terraform/modules/s3"
  bucket_name = "my-bucket-prod"
  environment = "production"
}
