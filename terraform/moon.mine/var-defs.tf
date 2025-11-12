variable "VIRTUAL_ENVIRONMENT_ENDPOINT" {
  description = "Proxmox endpoint - Environment Variable"
  type        = string
}

variable "PROXMOX_VE_API_TOKEN" {
  description = "Proxmox API token - Environment Variable"
  type        = string
}

variable "node_name" {
  description = "Node name"
  type        = string
}

variable "bridge" {
  description = "Internal Bridge"
  type        = string
}

variable "domain" {
  description = "Environment domain name"
  type        = string
}

# --- Instructions --- #
# Append permanent variables to .bashrc
# Source .bashrc
# Done


