resource "google_artifact_registry_repository" "docker-images" {
  location      = var.region
  repository_id = "docker-images"
  description   = "Repo for my Docker images"
  format        = "DOCKER"
}
resource "google_artifact_registry_repository" "helm-charts" {
  location      = var.region
  repository_id = "helm-charts"
  description   = "Repo for my Helm charts saved as OCI images"
  format        = "DOCKER"
}