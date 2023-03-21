resource "cloudflare_record" "dns" {
  for_each = { for dns_record in local.dns_records :
    dns_record.name => dns_record
  }
  name    = each.value.name
  proxied = true
  ttl     = 1
  type    = each.value.type
  value   = each.value.tunnel_record == true ? "${cloudflare_tunnel.tunnel.id}.cfargotunnel.com" : each.value.address
  zone_id = data.cloudflare_zone.sillock.id
}
