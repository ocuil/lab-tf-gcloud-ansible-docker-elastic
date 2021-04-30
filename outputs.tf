output "ip" {
  value = google_compute_instance.docker_nodes[*].network_interface.0.access_config.0.nat_ip
}

output "data" {
  value = google_compute_instance.docker_nodes[*]
  sensitive = true
}