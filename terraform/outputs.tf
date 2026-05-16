output "namespace_name" {
  value = kubernetes_namespace.sre_project.metadata[0].name
}