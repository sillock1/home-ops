terraform {
  backend "remote" {
    hostname     = "sillock.scalr.io"
    organization = "env-v0o8kh26r9qe4mqfe"

    workspaces {
      name = "home-ops"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.8.2"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }
  }
}

module "onepassword_item" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = local.onepassword_vault
  item   = local.onepassword_item
}
