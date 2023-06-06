output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}

output "docker_repo_id" {
  description = "Docker repo ID"
  value       = google_artifact_registry_repository.docker-images.id
}

output "helm_repo_id" {
  description = "Helm repo ID"
  value       = google_artifact_registry_repository.helm-charts.id
}