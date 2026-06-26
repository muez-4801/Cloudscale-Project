# إعداد وتحديد الموفرين (Providers) المطلوبين للمشروع
terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# تفعيل موفر خدمة Azure
provider "azurerm" {
  features {}
}