# 1. إنشاء مجموعة الموارد (Resource Group) باسم يحتوي على أسماء الطلاب
resource "azurerm_resource_group" "rg" {
  name     = "rg-cloudscale-${var.student_names}"
  location = var.location

  # الأوسام (Tags) المطلوبة في المشروع
  tags = {
    Project     = "Final"
    StudentName = "Moaz-Islam-Mohamed"
  }
}

# 2. إنشاء مستودع الحاويات (Azure Container Registry - ACR) بالفئة الأساسية Basic SKU
resource "azurerm_container_registry" "acr" {
  name                = "acrcloudscale${var.student_names}" # يجب أن يكون فريداً تماماً وأحرف صغيرة فقط
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"

  tags = {
    Project     = "Final"
    StudentName = "Moaz-Islam-Mohamed"
  }
}

# 3. إنشاء باقة الـ Kubernetes (Azure Kubernetes Service - AKS) بمواصفات محددة لتوفير التكلفة
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cloudscale-${var.student_names}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-cloudscale-${var.student_names}"

  # إعدادات الـ Node Pool: مطلوب عقدتين (2 Nodes) ومن نوع Standard_B2s
  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  # تفعيل الهوية المدارة للنظام للربط التلقائي
  identity {
    type = "SystemAssigned"
  }

  tags = {
    Project     = "Final"
    StudentName = "Moaz-Islam-Mohamed"
  }
}

# 4. دمج الـ AKS مع الـ ACR لإعطائه صلاحية سحب الصور تلقائياً (AcrPull) وبدون أسرار (No Secrets)
resource "azurerm_role_assignment" "aks_to_acr" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}