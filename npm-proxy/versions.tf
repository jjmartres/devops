terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    kubernetes-alpha = {
      source = "hashicorp/kubernetes-alpha"
    }
    template = {
      source = "hashicorp/template"
    }
    null = {
      source = "hashicorp/null"
    }
  }
  required_version = ">= 0.13"
}
