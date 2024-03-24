terraform {
  cloud {
    organization = "Jacks-organisation"

    workspaces {
      name = "example-eb-codepipeline"
    }
  }

  required_version = ">= 1.1.2"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "use1"
}

provider "aws" {
  region = "us-east-1"
}
