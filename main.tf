terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

terraform {
  backend "s3" {
    bucket         = "scalefree-tf-backend"
    key            = "tfAutomation_template/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "scalefree-tf-lock-backend"
  }
}

provider "aws" {
  region  = "eu-west-3"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0f61de2873e29e866"
  instance_type = "t2.nano"

  tags = {
    Name        = "DKawczynskiReusableWorkflowTest"
    Function    = "IT Infrastructure"
    Owner       = "dkawczynski@scalefree.com"
    Purpose     = "Test reusable workflow" 
    TF_ENV      = "uat"
    TF_REPO     = "NoRepo"
  }
}
