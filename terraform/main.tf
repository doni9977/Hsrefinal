resource "kubernetes_namespace" "sre_project" {
  metadata {
    name = "sre-capstone"
  }
}