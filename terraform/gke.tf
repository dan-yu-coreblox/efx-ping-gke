# GKE Cluster
resource "google_container_cluster" "primary" {
  name = "efx-ping-gke-cluster-us-east"
  location = var.region
  
  reomve_default_node_pool = true
  initial_node_count = 1
  
  network = var.network
  subnetwork = var.subnet
  
  master_auth {
    username = var.gke_username
    password = var.gke_password
    
    client_certificate_config {
      issue_client_certificate = false
    }
  }
  
  node_config {
    service_account = var.service_account
  }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name = "efx-ping-gke-node-pool-us-east"
  location = var.region
  cluster = google_container_cluster.primary.name
  node_count = var.gke_num_nodes
  
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
    
    label = {
      env = var.project_id
    }
    
    # preemptible = true
    machine_type = "n1-standard-1"
    tags = ["gke-node", "efx-ping-gke-us-east"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
    service_account = var.service_account
  }
}

output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}
