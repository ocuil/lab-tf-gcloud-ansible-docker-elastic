provider "google" {
  project     = var.gcloud["project"]
  region      = var.gcloud["region"]
  zone        = var.gcloud["zone"]
  credentials = var.gcloud["service_account_key"]
}

resource "google_compute_instance" "default" {
  name         = "node01"
  machine_type = "e2-micro"
  network_interface {
    network = "default"
    access_config {
      # ephemeral external ip address
    }
  }
  metadata = {
    foo = "elastic-laboratory"
  }

  metadata_startup_script = "echo hi > /tmp/test.txt"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
}
