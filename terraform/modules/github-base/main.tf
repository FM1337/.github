terraform {
  required_providers {
    graphql = {
      source  = "sullivtr/graphql"
      version = "2.5.1"
    }
  }
}

provider "graphql" {
  url = "https://api.github.com/graphql"
  headers = {
    "Authorization" = "Bearer ${var.github-token}"
  }
}

variable "github-token" {
  description = "github token for authenticating to fetch information"
  type        = string
  sensitive   = true
}

variable "filters" {
  description = "repository filters to apply"
  type        = any
}
