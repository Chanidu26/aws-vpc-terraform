terraform {
  backend "s3" {
    bucket         = "chanidu-terraform-state-bucket"                     
    key            = "vpc_terraform_state_dir/terraform.tfstate"      
    region         = "us-east-1"
  }
}