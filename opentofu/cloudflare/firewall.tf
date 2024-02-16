# Block countries and bots
resource "cloudflare_ruleset" "block_zone" {
  zone_id     = data.cloudflare_zone.domain.id
  name        = "Firewall rules to block requests for zone"
  description = "Block"
  kind        = "zone"
  phase       = "http_request_firewall_custom"

  rules {
    action      = "block"
    expression  = "(ip.geoip.country in {\"CN\" \"IN\" \"KP\" \"RU\"})"
    description = "Expression to block countries"
    enabled     = true
  }
  rules {
    action      = "block"
    expression  = "(cf.client.bot) or (cf.threat_score gt 14)"
    description = "Block bots determined by CF"
    enabled     = true
  }
}
