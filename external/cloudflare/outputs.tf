output "tunnel_token" {
  value     = cloudflare_tunnel.tunnel.tunnel_token
  sensitive = true
}