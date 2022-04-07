terraform {
  cloud {
    organization = "fm1337"

    workspaces {
      name = "github-sync-secrets"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "github" {
  token = var.github-token
}

output "repos" {
  value = module.base.repositories
}

output "user" {
  value = module.base.user
}
