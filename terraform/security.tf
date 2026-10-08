resource "yandex_vpc_security_group" "vms" {
  name       = "${var.vpc_name}-vms"
  network_id = module.vpc.yandex_vpc_network.id

  ingress {
    protocol       = "TCP"
    description    = "ssh from internal network"
    v4_cidr_blocks = [for s in var.vpc_subnets : s.cidr]
    port           = 22
  }

  egress {
    protocol       = "ANY"
    description    = "outgoing traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
