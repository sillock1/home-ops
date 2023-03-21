terraform {
  cloud {
    organization = "sillock"

    workspaces {
      name = "homelab-cloudflare"
    }
  }
}
