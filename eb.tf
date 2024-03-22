resource "aws_elastic_beanstalk_application" "app" {
  name = var.app_name
}

resource "aws_elastic_beanstalk_environment" "development" {
  name                = "${var.app_name}-env"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2023 v6.1.1 running Node.js 20"
}