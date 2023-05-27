terraform {
  required_version = "~> 1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.67"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}