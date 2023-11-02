data "google_compute_network" "my-network" {
  name = "project-network"
}

resource "google_compute_subnetwork" "workload-subnet" {
  name          = "workload-subnet"
  ip_cidr_range = var.cidr-workload-subnet
  region        = var.region-workload-subnet
  network       = data.google_compute_network.my-network.id
}
