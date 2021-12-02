

resource "azurerm_resource_group" "rg" {
  name     = var.rgName
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aksname
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dnsprefix

  default_node_pool {
    name       = "agentpool"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }
  role_based_access_control {
    enabled = true
  }
  network_profile {
    network_plugin = "kubenet"
  }
  identity {
    type = "SystemAssigned"
  }
}
