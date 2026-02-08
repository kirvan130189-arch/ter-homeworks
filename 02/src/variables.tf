###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2bFomo0QnSKhW6mQNo904PDY4UUlNKyx29LHGn3zgsxPHkfn46k0SkEqvkZX6cuY8HTGSpEwgu8db3BfrYkMpJLdDg8QAyQPbWrdNNT09k6vtldB51j9Kij32/JAnyJp8A6bn+jj/ge6ZboYVQ7v0ZdUIvP67SqGRpQAK+99M0cdJRVap0dzTwVSoGCsBNR1rUtzNj7Yr/C/QRuD0LlIG7A3Kgmt5tH32z0TXRnvBV1oHjS4iG8LzYXKSJqobXyHSwbhoWYYRyeTAHHY29gbU/9B+gfRsLdIPg0Vr35w14FmzuWHBRHIoRbgFHgL0OEGfDU0ynQEtgD2R3uJTNIXj"
  description = "ssh-keygen -t ed25519"
}
