provider "google" {
  project     = var.gcloud["project"]
  region      = var.gcloud["region"]
  zone        = var.gcloud["zone"]
  credentials = var.gcloud["service_account_key"]
}

resource "google_compute_instance" "docker_nodes" {
  count        = 3
  name         = "node-${count.index}"
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

  metadata_startup_script = "sudo apt update -y && sudo apt upgrade -y"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  tags = ["laboratory", "elasticsearch", "docker", "ansible", "terraform"]

}

resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      private-ip = google_compute_instance.docker_nodes[*].network_interface.0.access_config.0.nat_ip
    }
  )
  filename = "inventory"
}
