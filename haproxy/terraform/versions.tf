terraform {
  required_version = ">= 0.12"
  experiments      = [variable_validation]
  required_providers {
    aws = {
      version = "~> 2.0"
    }
  }
}
