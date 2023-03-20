terraform {
  required_version = ">=1.1.5"

  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = ">=0.24.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.18.1"
    }
    github = {
      source  = "integrations/github"
      version = ">=5.18.0"
    }
  }
}