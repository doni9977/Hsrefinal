resource "google_container_cluster" "primary" {
  name     = "sre-capstone-cluster"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "sre-capstone-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    machine_type = "e2-medium"
  }
}