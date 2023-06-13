resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke"
  location = "${var.region}-a"

  network                  = google_compute_network.vpc.name
  subnetwork               = google_compute_subnetwork.subnet.name
  remove_default_node_pool = true
  initial_node_count       = 1

}
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.primary.id
  node_count = 1

  node_config {
    machine_type = "e2-small"
  }

}
# For cluster bootstrapping. Updates handled in CI/CD
resource "helm_release" "cicd" {
  name       = "cicd"
  repository = "oci://us-west1-docker.pkg.dev/weather-app-388708/helm-charts"
  chart      = "cicd"
  version    = "1.0"
  lifecycle {
    ignore_changes = [
      version,
    ]
  }
}
resource "helm_release" "monitoring" {
  name       = "monitoring"
  repository = "oci://us-west1-docker.pkg.dev/weather-app-388708/helm-charts"
  chart      = "monitoring"
  version    = "1.0"
  lifecycle {
    ignore_changes = [
      version,
    ]
  }
}