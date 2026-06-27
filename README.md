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

📂 Repository Structure
The repository is systematically organized according to submission guidelines:

```bash
├── .github/
│   └── workflows/
│       └── ci-cd.yml          # GitHub Actions multi-stage CI/CD pipeline 
├── app/
│   ├── server.js              # Core web application source code 
│   ├── package.json           # manage dependencies, metadata, and automation scripts
├── k8s/
│   ├── deployment.yaml        # Kubernetes Deployment manifest (3 replicas, Probes) 
│   └── service.yaml           # Kubernetes Service manifest (LoadBalancer type) 
├── terraform/
│   ├── providers.tf           # Terraform providers configuration 
│   ├── main.tf                # Primary infrastructure definitions (RG, ACR, AKS) 
│   ├── variables.tf           # Input variable declarations 
│   └── outputs.tf             # Infrastructure output details 
├── .gitignore                 # Extensively configured git exclusion patterns 
├── Dockerfile                 # Multi-stage optimized Docker build definition 
└── README.md                  # Comprehensive project blueprint and documentation 
