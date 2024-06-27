terraform {
  required_providers {
    keycloak = {
      source = "mrparkers/keycloak"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

variable "keycloak_url" {
  type = string
}

variable "keycloak_username" {
  type = string
}

variable "keycloak_password" {
  type = string
}

provider "keycloak" {
  client_id = "admin-cli"
  url       = var.keycloak_url
  username  = var.keycloak_username
  password  = var.keycloak_password
}
