resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_gateway" "nat_gateway" {
  name = "${var.vpc_name}-nat-gateway"

  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "develop" {
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}

resource "yandex_vpc_subnet" "develop_web" {
  name           = "${var.vpc_name}-${var.vm_web_zone}"
  zone           = var.vm_web_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_web_subnet_cidr
  route_table_id = yandex_vpc_route_table.develop.id
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = "${var.vpc_name}-${var.vm_db_zone}"
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_subnet_cidr
  route_table_id = yandex_vpc_route_table.develop.id
}

data "yandex_compute_image" "web" {
  family = var.vm_web_image_family
}

data "yandex_compute_image" "db" {
  family = var.vm_db_image_family
}

resource "yandex_compute_instance" "platform_web" {
  name        = local.vm_web_name
  platform_id = var.vm_web_platform_id
  zone        = var.vm_web_zone

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.web.image_id
      type     = var.vms_resources.web.disk_type
      size     = var.vms_resources.web.disk_size
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_web.id
    nat       = var.vm_use_public_ip
  }

  metadata = local.common_metadata
}

resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_zone

  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.db.image_id
      type     = var.vms_resources.db.disk_type
      size     = var.vms_resources.db.disk_size
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = var.vm_use_public_ip
  }

  metadata = local.common_metadata
}
