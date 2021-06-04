resource "digitalocean_vpc" "production" {
  name     = "production"
  region   = "nyc3"
  ip_range = "10.0.0.0/16"
}
