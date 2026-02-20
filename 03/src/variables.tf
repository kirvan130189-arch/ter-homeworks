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
  description = "Path to service account key JSON"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "Subnet CIDR"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network and subnet base name"
}

### SSH and image vars

variable "ssh_public_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to SSH public key file"
}

variable "fallback_ssh_public_key" {
  type        = string
  default     = ""
  description = "Fallback public key if ssh_public_key_path does not exist"
}

variable "vm_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Compute image family"
}

### Task 2.2 variable (required shape)

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))

  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 2
      disk_volume = 10
    },
    {
      vm_name     = "replica"
      cpu         = 4
      ram         = 4
      disk_volume = 15
    }
  ]
}

### Optional task 6* switch

variable "run_ansible_playbook" {
  type        = bool
  default     = false
  description = "Run ansible-playbook via null_resource"
}
