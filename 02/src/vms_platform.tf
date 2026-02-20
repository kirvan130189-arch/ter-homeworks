### VM web vars (task 2 + task 3)

variable "vm_web_name_prefix" {
  type    = string
  default = "netology"
}

variable "vm_web_name_env" {
  type    = string
  default = "develop"
}

variable "vm_web_name_project" {
  type    = string
  default = "platform"
}

variable "vm_web_name_role" {
  type    = string
  default = "web"
}

variable "vm_web_platform_id" {
  type    = string
  default = "standard-v1"
}

variable "vm_web_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_web_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vm_web_subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "vm_web_preemptible" {
  type    = bool
  default = true
}

### VM db vars (task 3)

variable "vm_db_name_prefix" {
  type    = string
  default = "netology"
}

variable "vm_db_name_env" {
  type    = string
  default = "develop"
}

variable "vm_db_name_project" {
  type    = string
  default = "platform"
}

variable "vm_db_name_role" {
  type    = string
  default = "db"
}

variable "vm_db_platform_id" {
  type    = string
  default = "standard-v3"
}

variable "vm_db_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_db_zone" {
  type    = string
  default = "ru-central1-b"
}

variable "vm_db_subnet_cidr" {
  type    = list(string)
  default = ["10.0.2.0/24"]
}

variable "vm_db_preemptible" {
  type    = bool
  default = true
}