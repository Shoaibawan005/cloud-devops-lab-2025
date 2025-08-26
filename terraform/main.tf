terraform {
  required_version = ">= 1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "cloud-devops-lab-2025-shoaib-abbas"
    key            = "envs/dev/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "cloud-devops-lab-2025-tf-locks"
    encrypt        = true
  }
}