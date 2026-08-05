variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  description = "List of VMs for databases"
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 2
      disk_volume = 10
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 1
      disk_volume = 8
    }
  ]
}

locals {
  db_vms = {
    for vm in var.each_vm : vm.vm_name => vm
  }
}

resource "yandex_compute_instance" "db" {
  for_each    = local.db_vms
  name        = each.key
  platform_id = "standard-v3"
  zone        = var.default_zone
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = "fd8lf1fg0mt4hocd96qi"
      size     = each.value.disk_volume
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}