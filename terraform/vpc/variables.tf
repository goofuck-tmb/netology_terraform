variable "env_name" {
  type        = string
  description = "VPC network name (prefix for subnets)"
}

variable "subnets" {
  type = list(object({
    zone = string
    cidr = string
  }))
  description = "Subnets list: zone + cidr, one subnet per element"
}
