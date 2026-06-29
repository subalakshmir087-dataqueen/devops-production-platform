
resource "google_compute_instance" "devops_server" {
  name         = "devops-server"
  machine_type = "e2-small"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
    }
  }
  network_interface {
     subnetwork = google_compute_subnetwork.devops_subnet.id

    access_config {
    }
  }
  tags = ["devops", "jenkins"]

  metadata = {
    enable-oslogin = "TRUE"
  }
}
