locals {
  vms = {
    brassknuckles = {
      clone = 602
      vm_id = 202
      name  = "brassknuckles${var.domain}"
    }
    cthulu = {
      clone = 603
      vm_id = 203
      name  = "cthulu${var.domain}"
    }
    donut = {
      clone = 604
      vm_id = 204
      name  = "donut${var.domain}"
    }
    kerberos = {
      clone = 605
      vm_id = 205
      name  = "kerberos${var.domain}"
    }
    nix = {
      clone = 606
      vm_id = 206
      name  = "nix${var.domain}"
    }
    pandemonium = {
      clone = 607
      vm_id = 207
      name  = "pandemonium${var.domain}"
    }
    tartarus = {
      clone = 608
      vm_id = 208
      name  = "tartarus${var.domain}"
    }
    viking = {
      clone = 609
      vm_id = 209
      name  = "viking${var.domain}"
    }
  }
}

resource "proxmox_virtual_environment_vm" "moon_mine" {
  for_each        = local.vms
  node_name       = var.node_name
  stop_on_destroy = true
  vm_id           = each.value.vm_id
  name            = each.value.name

  agent {

    enabled = false

  }

  clone {

    vm_id     = each.value.clone
    node_name = var.node_name
    full      = false

  }

  network_device {
    bridge = var.bridge
  }
}


resource "proxmox_virtual_environment_vm" "alpine-router" {
  node_name       = var.node_name
  stop_on_destroy = true
  vm_id           = 201
  name            = "balrog${var.domain}"

  agent {
    enabled = false
  }

  clone {
    vm_id     = 601
    node_name = var.node_name
    full      = false
  }

  network_device {
    bridge      = "external"
    mac_address = "CC:DC:CC:DC:CC:DC"
  }

  network_device {
    bridge = var.bridge
  }
}

