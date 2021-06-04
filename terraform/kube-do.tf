data "digitalocean_kubernetes_versions" "production" {
  version_prefix = "1.20."
}

resource "digitalocean_kubernetes_cluster" "production" {
  name         = "production"
  region       = "nyc3"
  vpc_uuid     = digitalocean_vpc.production.id
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.production.latest_version

  node_pool {
    name       = "default"
    size       = "s-1vcpu-2gb"
    node_count = 2
  }
}
