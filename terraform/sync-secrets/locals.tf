locals {
  module_name = basename(abspath(path.module))

  secrets = {
    DOCKER_USERNAME = var.docker-username
    DOCKER_PASSWORD = var.docker-password
  }
}

variable "github-token" {
  sensitive = true
}

variable "docker-username" {
  sensitive = true
}
variable "docker-password" {
  sensitive = true
}
