resource "kubernetes_namespace" "app" {
  metadata {
    name = "app"
  }
}

resource "kubernetes_namespace" "infra" {
  metadata {
    name = "infra"
  }
}