terraform {
  required_version = "~> 0.15.5"

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket                      = "carkmorwin"
    endpoint                    = "https://nyc3.digitaloceanspaces.com"
    key                         = "infrastructure/terraform.tfstate"
    region                      = "us-east-1" // required
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}

# Set in secure.tfvars file
variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}
