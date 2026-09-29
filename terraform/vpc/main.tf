resource "yandex_vpc_network" "develop" {
  name = var.env_name
}

resource "yandex_vpc_subnet" "develop" {
  for_each       = { for s in var.subnets : s.zone => s }
  name           = "${var.env_name}-${each.key}"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [each.value.cidr]
}
