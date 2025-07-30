terraform {
  backend "remote" {
    organization = "bilal-solo-adventures"
    project      = "terraform-gitops-infrastructure"

    workspaces {
      name = "gitops-dev-ap-south-1"
    }
  }
}