### Cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "service_account_key_file" {
  type        = string
  default     = "~/.authorized_key.json"
  description = "Path to authorized service account key json"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network name"
}

### SSH vars

variable "vms_ssh_public_root_key" {
  type        = string
  description = "Public SSH key for ubuntu user"
}

### Common VM metadata (task 6)

variable "metadata" {
  type = map(string)
  default = {
    serial-port-enable = "1"
  }
  description = "Common metadata for all VMs"
}

### VM resources map (task 6)

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
    disk_type     = string
  }))

  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
      disk_size     = 10
      disk_type     = "network-hdd"
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size     = 10
      disk_type     = "network-hdd"
    }
  }
}

### Enable/disable public IP on both VMs (task 9*)

variable "vm_use_public_ip" {
  type        = bool
  default     = false
  description = "Set false to test NAT gateway scenario"
}

### Task 8* type variable

variable "test" {
  type = list(map(tuple([string, string])))
  default = [
    {
      dev1 = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
        "10.0.1.7",
      ]
    },
    {
      dev2 = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
        "10.0.2.29",
      ]
    },
    {
      prod1 = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
        "10.0.1.30",
      ]
    },
  ]
}

# Task 6: deprecated per-VM resource variables (commented as no longer used)
# variable "vm_web_cores" {}
# variable "vm_web_memory" {}
# variable "vm_web_core_fraction" {}
# variable "vm_db_cores" {}
# variable "vm_db_memory" {}
# variable "vm_db_core_fraction" {}