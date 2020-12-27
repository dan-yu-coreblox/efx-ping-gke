variable "project_id" {
  description = "Project ID"
}

variable "region" {
  description = "Region"
}

variable "cluster_name" {
  description = "Cluster Name"
}

variable "network" {
  description = "Network for GKE Cluster"
}

variable "subnet" {
  description = "Subnet for GKE Cluster"
}

variable "service_account" {
  description = "Service Account used to run GKE Cluster"
}

variable "gke_username" {
  default = ""
  description = "GKE Username"
}

variable "gke_password" {
  default = ""
  description = "GKE Password"
}

variable "gke_num_nodes" {
  default = 1
  description = "number of gke nodes"
}

variable "master_ipv4_cidr_block" {
  description = "Master IPv4 CIDR Block for GKE Cluster"
}
