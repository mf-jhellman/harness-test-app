# Terraform state info
terraform {
  backend "s3" {
    bucket  = "tf-state-mf-eiger-dev-default"
    key     = "state/zztest-octopus-deploy"
    region  = "us-east-1"
    encrypt = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.29.0"
    }
    octopusdeploy = {
      source  = "OctopusDeployLabs/octopusdeploy"
      version = "0.8.1"
    }
  }
}

## LATER ON WE MIGHT WANT TO 
# data "octopusdeploy_space" "demo" {
#   provider = octopusdeploy.unscoped
#   name     = "Demo"
# }

# provider "octopusdeploy" {
#   address  = "https://markforged.octopus.app/"
#   api_key  = "API-NWXCLSEK8QMKQNNLZONX67UCOGTJX3"
#   space_id = "Spaces-2"
#   alias    = "demo_space"
# }


# provider "octopusdeploy" {
#   # Configuration options

# address = "https://markforged.octopus.app/"
# api_key = "API-NWXCLSEK8QMKQNNLZONX67UCOGTJX3"
# }

# ## NOTE FOR LATER, YOU'VE SCOPED THIS ENTIRE THING TO THE DEMO ORG.

provider "octopusdeploy" {
  address = "https://markforged.octopus.app/"
  api_key = "API-NWXCLSEK8QMKQNNLZONX67UCOGTJX3"
  alias   = "unscoped"
}

data "octopusdeploy_space" "demo" {
  provider = octopusdeploy.unscoped
  name     = "Demo"
}

provider "octopusdeploy" {
  address  = "https://markforged.octopus.app/"
  api_key  = "API-NWXCLSEK8QMKQNNLZONX67UCOGTJX3"
  space_id = "Spaces-2" #data.octopusdeploy_space.demo.id
}

provider "aws" {
  region = "us-east-1"
}
