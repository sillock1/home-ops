resource "random_password" "password" {
  length  = 64
  special = false
}

resource "cloudflare_tunnel" "tunnel" {
  account_id = local.cloudflare_account_id
  name       = local.tunnel_name
  secret     = base64encode(random_password.password.result)
}

resource "cloudflare_tunnel_config" "config" {
  account_id = local.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.tunnel.id

  config {

   ## Requires no TLS verify but the current terraform provider doesn't allow this
   #origin_request {
   #   no_tls_verify = true
   # }
    dynamic "ingress_rule" {
      for_each = local.ingress_rules
      iterator = item
      content {
        hostname = "${item.value.subdomain}.${data.cloudflare_zone.sillock.name}"
        service  = item.value.address
      }
    }

    ingress_rule {
      service = "http://default:80"
    }

  }
}