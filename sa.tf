
resource "google_service_account" "cluster-serviceaccount" {
  account_id   = "cluster-serviceaccount"
  display_name = "Service Account For Workload To Access Artifact registry"
}


resource "google_project_iam_member" "read-artifactregistry" {
  project = var.project
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.cluster-serviceaccount.email}"
}

resource "google_project_iam_member" "Least-privilage-nodepool" {
  project = var.project
  role    = "roles/container.nodeServiceAccount"
  member  = "serviceAccount:${google_service_account.cluster-serviceaccount.email}"
}

 