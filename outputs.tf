output "ip" {
  value = google_compute_instance.docker_nodes[*].network_interface.0.access_config.0.nat_ip
}

output "id" {
  value = google_compute_instance.docker_nodes[*].id
  #sensitive = true
}

output "instance_id" {
  value = google_compute_instance.docker_nodes[*].instance_id
}