terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region                  = "us-west-2"
  shared_credentials_files = ["/home/jenkins/.aws/credentials"]
  profile                 = "dev"
}
