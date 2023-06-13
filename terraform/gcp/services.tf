resource "google_project_service" "resource_manager_api" {
  project                    = var.project_id
  service                    = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = true
}
resource "google_project_service" "gke_api" {
  project                    = var.project_id
  service                    = "container.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project_service.resource_manager_api
  ]
}
resource "google_project_service" "artifact_registry_api" {
  project                    = var.project_id
  service                    = "artifactregistry.googleapis.com"
  disable_dependent_services = true
}