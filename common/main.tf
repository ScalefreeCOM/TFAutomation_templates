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
    key            = "tfAutomation_template/common/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "scalefree-tf-lock-backend"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-kawczynski"

}