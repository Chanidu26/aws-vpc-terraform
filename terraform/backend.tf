terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"                      # Replace with your S3 bucket name
    key            = "vpc_terraform_state_dir/terraform.tfstate"      # Path inside the bucket
    region         = "us-east-1"
  }
}