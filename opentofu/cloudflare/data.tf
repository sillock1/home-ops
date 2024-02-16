data "cloudflare_zone" "domain" {
  account_id = cloudflare_account.main.id
  name       = "sillock.io"
}

data "http" "ipv4_lookup_raw" {
  url = "http://ipv4.icanhazip.com"
}
