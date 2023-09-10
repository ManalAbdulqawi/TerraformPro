terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.14.0"
    }

  }

    backend "s3" {
    # Replace this with your bucket name!
    bucket = "bucket-manal-terraform"
    key = "global/s3/terraform.tfstate"
    region="eu-west-2"
    # Replace this with your DynamoDB table name!
    dynamodb_table ="first-dynamodb-table"
    encrypt        = true
  }

  }

# Configure the AWS Provider
provider "aws" {
  region = var.region
}