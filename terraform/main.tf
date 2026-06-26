resource "azurerm_resource_group" "rg" {
  name     = "rg-cloudscale-${var.student_names}"
  location = var.location

  tags = {
    Project     = "Final"
    StudentName = "Moaz-Islam-Mohamed"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "acrcloudscale${var.student_names}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"

  tags = {
    Project     = "Final"
    StudentName = "Moaz-Islam-Mohamed"
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cloudscale-${var.student_names}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-cloudscale-${var.student_names}"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Project     = "Final"
    StudentName = "Moaz-Islam-Mohamed"
  }
}

resource "azurerm_role_assignment" "aks_to_acr" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}