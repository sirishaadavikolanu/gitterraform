provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "cicd_bucket" {
  bucket = "my-cicd-demo-bucket-xyz123" # Make this unique!
}
terraform {
     required_providers {
       aws = {
         source  = "hashicorp/aws"
         version = "~> 5.0"
       }
     }
}

resource "aws_dynamodb_table" "my_tables" {
  for_each     = var.databases
  name         = each.value 
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
