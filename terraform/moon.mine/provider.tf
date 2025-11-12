terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.86.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.VIRTUAL_ENVIRONMENT_ENDPOINT
  api_token = var.PROXMOX_VE_API_TOKEN
  insecure  = true
  ssh {
    agent    = true
    username = "terraform"
  }
}
