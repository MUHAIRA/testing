// This will store the Terraform state in a separate S3 bucket.

terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "aws-setup/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}
