terraform {
    required_providers {
        scalr = {
            source = "registry.scalr.io/scalr/scalr"
            version= "~> 1.0.0"
        }
    }
}

variable "provider_name" {
  type = string
}

variable "environment_name" {
  type = string
}

data "scalr_vcs_provider" test {
  name = var.provider_name
}

resource "scalr_environment" test {
  name = "env-name"
}

resource "scalr_workspace" "dev" {
  name            = "dev"
  environment_id  = scalr_environment.test.id
  vcs_provider_id = data.scalr_vcs_provider.test.id

  working_directory = "app"

  vcs_repo {
      identifier          = "emocharnik/terraform-scalr-templates"
      branch              = "main"
      trigger_prefixes    = ["app", "variables/dev"]
  }

  var_files = ["variables/dev/inputs.tfvars"]
}

resource "scalr_workspace" "prod" {
  name            = "prod"
  environment_id  = scalr_environment.test.id
  vcs_provider_id = data.scalr_vcs_provider.test.id

  working_directory = "app"

  vcs_repo {
      identifier          = "emocharnik/terraform-scalr-templates"
      branch              = "main"
      trigger_prefixes    = ["app", "variables/prod"]
  }

  var_files = ["variables/prod/inputs.tfvars"]
}