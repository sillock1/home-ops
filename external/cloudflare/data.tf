data "cloudflare_zone" "sillock" {
  account_id = var.cloudflare_account_id
  name       = "sillock.io"
}
