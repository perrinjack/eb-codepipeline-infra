terraform {
  cloud {
    organization = "Jacks-organisation"

    workspaces {
      name = "example-eb-codepipeline"
    }
  }

  required_version = ">= 1.7.5"
}

provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "use1"
}
