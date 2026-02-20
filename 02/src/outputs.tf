output "vms_info" {
  description = "Names, external IPs and FQDNs for all VMs"
  value = {
    web = {
      instance_name = yandex_compute_instance.platform_web.name
      external_ip   = try(yandex_compute_instance.platform_web.network_interface[0].nat_ip_address, null)
      fqdn          = yandex_compute_instance.platform_web.fqdn
    }
    db = {
      instance_name = yandex_compute_instance.platform_db.name
      external_ip   = try(yandex_compute_instance.platform_db.network_interface[0].nat_ip_address, null)
      fqdn          = yandex_compute_instance.platform_db.fqdn
    }
  }
}
