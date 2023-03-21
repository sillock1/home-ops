variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token for writing tunnel and DNS records"
  default     = ""
}

variable "cloudflare_account_id" {
  type        = string
  description = "Account ID for the Cloudflare account to provision resources under"
  default     = ""
}

variable "tunnel_name" {
  type        = string
  description = "DNS name for the tunnel e.g. `example.com`"
  default     = ""
}

variable "dns_records" {
  type = list(object({
    name          = string
    type          = string
    address       = optional(string)
    tunnel_record = bool
  }))
  description = "List of domain names and the address they point to"
}


variable "ingress_rules" {
  type = list(object({
    subdomain = string
    address   = string
  }))
  description = "Subdomain name and kubernetes KubeDNS name as a key value pair for Cloudflare tunnel config"

  default = [{
    address   = ""
    subdomain = ""
  }]
}
