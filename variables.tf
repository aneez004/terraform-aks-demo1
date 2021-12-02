variable "rgName" {
  type    = string
  default = "aks-terraform-demo"
}
variable "location" {
  type    = string
  default = "eastus"
}
variable "aksname" {
  default = "az104-aks"
}
variable "dnsprefix" {
  default = "aksazure"
}

variable "subscription_id" {}
variable "tenant_id" {}
variable "service_principal_appid" {}
variable "service_principal_password" {}
