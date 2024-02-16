resource "cloudflare_account" "main" {
  name = "sillock"
  type = "standard"
  lifecycle {
    prevent_destroy = true
  }
}
