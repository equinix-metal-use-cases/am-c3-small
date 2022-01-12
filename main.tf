module "key" {
  source     = "git::github.com/andrewpopa/terraform-metal-project-ssh-key"
  project_id = var.project_id
}

module "device" {
  source = "git::github.com/andrewpopa/terraform-metal-device.git"
  hostname            = "am-c3-small"
  plan                = "c3.small.x86"
  facilities          = ["am6"]
  operating_system    = "ubuntu_18_04"
  billing_cycle       = "hourly"
  project_id          = var.project_id
  project_ssh_key_ids = [module.key.id]
}