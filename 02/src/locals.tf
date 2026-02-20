locals {
  vm_web_name = "${var.vm_web_name_prefix}-${var.vm_web_name_env}-${var.vm_web_name_project}-${var.vm_web_name_role}"
  vm_db_name  = "${var.vm_db_name_prefix}-${var.vm_db_name_env}-${var.vm_db_name_project}-${var.vm_db_name_role}"

  common_metadata = merge(var.metadata, {
    ssh-keys = "ubuntu:${var.vms_ssh_public_root_key}"
  })
}
