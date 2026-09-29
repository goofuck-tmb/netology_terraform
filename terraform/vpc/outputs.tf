output "yandex_vpc_network" {
  description = "VPC network"
  value       = yandex_vpc_network.develop
}

output "subnets" {
  description = "Subnets map, key = zone"
  value       = yandex_vpc_subnet.develop
}
