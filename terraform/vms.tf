module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=a230c799304c20f15f0ad761ed704e46f534a821"
  env_name       = "marketing" 
  network_id     = module.vpc.yandex_vpc_network.id
  subnet_zones   = [module.vpc.subnets[var.default_zone].zone]
  subnet_ids     = [module.vpc.subnets[var.default_zone].id]
  instance_name  = "marketing"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = false
  security_group_ids = [yandex_vpc_security_group.vms.id]

  labels = { 
    owner= "m.trishin",
    project = "marketing"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }
}


module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=a230c799304c20f15f0ad761ed704e46f534a821"
  env_name       = "analytics" 
  network_id     = module.vpc.yandex_vpc_network.id
  subnet_zones   = [module.vpc.subnets[var.default_zone].zone]
  subnet_ids     = [module.vpc.subnets[var.default_zone].id]
  instance_name  = "analytics"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = false
  security_group_ids = [yandex_vpc_security_group.vms.id]

  labels = { 
    owner= "m.trishin",
    project = "analytics"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_keys = var.vms_ssh_root_key
  }
}