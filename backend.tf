terraform {
  cloud {
    organization = "Jacks-organisation"

    workspaces {
      name = "example-eb-codepipeline"
    }
  }

  required_version = ">= 1.1.2"
}
