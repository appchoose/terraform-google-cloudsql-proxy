module "cloudsql_proxy_abcd" {
  source = "TODO"

  project         = "your-project"
  container_image = "eu.gcr.io/cloudsql-docker/gce-proxy:1.32.0"
  instance_name   = "my-cloudsql-proxy"
  container_args = [
    "-instances=${google_sql_database_instance.main.connection_name}=tcp:0.0.0.0:5432",
    "-enable_iam_login",
  ]

  vm_zone       = "europe-west1-b"
  vm_subnetwork = google_compute_subnetwork.subnetwork.self_link

  firewall_network       = google_compute_network.main.self_link
  firewall_source_ranges = ["0.0.0.0/0"]
}
