terraform {
  required_version = "~> 1.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.66.0"
    }
  }
}

# For getting the service account token
provider "google" {
  alias = "impersonation"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}

data "google_service_account_access_token" "default" {
  provider               = google.impersonation
  target_service_account = var.terraform_service_account
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "1200s"
}

# Use our Terraform service account
provider "google" {
  project      = var.project_id
  region       = var.region
  access_token = data.google_service_account_access_token.default.access_token
}

provider "helm" {
  kubernetes {
    host  = "https://${google_container_cluster.primary.endpoint}"
    token = data.google_service_account_access_token.default.access_token
    cluster_ca_certificate = base64decode(
      resource.google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
    )
  }
  registry {
    url      = "oci://us-west1-docker.pkg.dev/weather-app-388708/helm-charts"
    username = "oauth2accesstoken"
    password = data.google_service_account_access_token.default.access_token
  }
}