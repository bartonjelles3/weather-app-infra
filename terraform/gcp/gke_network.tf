resource "kubernetes_namespace" "network" {
  metadata {
    name = "network"
  }
}
module "nginx-controller" {
  source         = "terraform-iaac/nginx-controller/helm"
  version        = "2.1.1"
  depends_on     = [kubernetes_namespace.network]
  namespace      = "network"
  additional_set = []
}
