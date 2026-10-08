###cloud vars
variable "service_account_key_file" {
  type    = string
  default = "~/.authorized_key.json"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default     = "b1ggme4a7fhrb6i9gktm"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default     = "b1g7p42bdrmq4jaccn7s"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vpc_subnets" {
  type = list(object({
    zone = string
    cidr = string
  }))
  default = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
  ]
  description = "Subnets for module vpc"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###common vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkOtYnZ666JbfiOtz/zjwMhDHz7u9qqBcheCGlziHs0mWq2SOMZTVeCsG/vZbxCpavx2TYW6lki4uEl5B6Ys7YUMlV1Eczh2Je+VLj86MOY9XOWg9ovKzbW3/EUDBDyQ8J17YtRiZ6mOY9HyjVAN9dTUQO0fXps8DxDDh846PJFU89rQU3uDiYSbUhXUNQqYhNJyPQRayH2Cfm6GTJNhg9/S+qCWyryVpZ6Sy3wgsvXayHEBK57+HZaCUnKM9Vl94SPLXKsiDK781MgE+cZB5/Zmvd9CxbCnPNWFLlSvy/INGy5vhxLObd5K6Y0OA5h+txsBksMOsjRWkLu6ejHAux"
  description = "ssh-keygen -t ed25519"
}
