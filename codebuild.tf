data "aws_iam_policy_document" "assume_role_code_build" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "code_build_role" {
  name               = "code_build_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_code_build.json
}

resource "aws_codebuild_project" "nest_build" {
  name         = "${var.app_name}-codebuild-project"
  service_role = aws_iam_role.code_build_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "PORT"
      value = "8080"
    }
  }

  source {
    type = "CODEPIPELINE"
  }
}