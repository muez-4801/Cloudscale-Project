# CloudScale DevOps Final Project

## Project Description
This repository contains a full CI/CD deployment pipeline for CloudScale containerized web application deployed on Azure AKS and integrated with Azure Container Registry (ACR), provisioned entirely using Terraform.

## Authors
- Moaz, Islam, and Mohamed

## Repo Contents
- `terraform/`: Infrastructure as Code configuration files.
- `k8s/`: Kubernetes manifest deployment configurations.
- `app/`: Source code of Node.js app with health endpoints.

## 🚀 AKS Kubernetes Deployment Status
- **Region**: Sweden Central (`swedencentral`)
- **Cluster Name**: `aks-cloudscale-ezoismo`
- **Container Registry**: `acrcloudscaleezoismo.azurecr.io`
- **Pipeline Provider**: GitHub Actions

## Project Status
Successfully deployed to AKS cluster with CI/CD pipeline and manual approval.