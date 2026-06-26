# استخراج اسم مجموعة الموارد بعد الإنشاء لاستخدامه في الأتمتة
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# استخراج رابط مستودع الـ ACR لمعرفة المسار المعتمد لرفع الصور
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

# استخراج اسم باقة الـ AKS لربطه بسير العمل
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}