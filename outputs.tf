output "instance_private_ip" {
  value = google_compute_instance.main.network_interface.0.network_ip
}
