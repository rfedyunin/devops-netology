resource "local_file" "inventory" {
  filename = "inventory.ini"
  content = templatefile("${path.module}/inventory.tpl", {
    webservers = yandex_compute_instance.web[*].network_interface[0].nat_ip_address
    databases  = [for vm in yandex_compute_instance.db : vm.network_interface[0].nat_ip_address]
    storage    = yandex_compute_instance.storage.network_interface[0].nat_ip_address
    web_names  = yandex_compute_instance.web[*].name
    db_names   = [for vm in yandex_compute_instance.db : vm.name]
    storage_name = yandex_compute_instance.storage.name
    web_fqdns  = yandex_compute_instance.web[*].fqdn
    db_fqdns   = [for vm in yandex_compute_instance.db : vm.fqdn]
    storage_fqdn = yandex_compute_instance.storage.fqdn
  })
}