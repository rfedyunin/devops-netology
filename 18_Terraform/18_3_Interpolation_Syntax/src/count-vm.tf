locals {
  ssh_public_key = file("~/.ssh/id_ed25519.pub")
  web_count      = 2
}

resource "yandex_compute_instance" "web" {
  count       = local.web_count
  name        = "web-${count.index + 1}"
  platform_id = "standard-v3"
  zone        = var.default_zone
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = "fd8lf1fg0mt4hocd96qi"
      size     = 10
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }
  depends_on = [yandex_compute_instance.db]
}