terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.34.0"
    }
    github = {
      source = "integrations/github"
      version = "5.3.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region                  = "us-west-2"
  shared_credentials_files = ["/home/jenkins/.aws/credentials"]
  profile                 = "dev"
}

provider "github" {
  token = "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"
  owner = "sairevathy23"
}
