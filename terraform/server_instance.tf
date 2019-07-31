provider "google" {
  project = "digital-innovation-one-248300"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network       = "${google_compute_network.server_net.name}"
    access_config {
    }
  }

  connection {
    type        = "ssh"
    user        = "${var.user}"
    private_key = "${file(var.key_file)}"
  }

  provisioner "file" {
    source      = "./scripts/"
    destination = "/home/${var.user}/"
  }

  provisioner "file" {
    source      = "../api/docker-compose.yaml"
    destination = "/home/${var.user}/docker-compose.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "cd /home/${var.user}",
      "chmod +x /home/${var.user}/*.sh",
      "./bootstrap.sh",
    ]
  }
  provisioner "remote-exec" {
    inline = ["cd /home/${var.user}",
      "chmod +x /home/${var.user}/*.sh",
      "./setup_instance.sh",
      "docker-compose up -d"
    ]
  }
}

resource "google_compute_firewall" "http_server_firewall" {
  name    = "test-firewall"
  network = "${google_compute_network.server_net.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  source_tags = ["api"]
}

resource "google_compute_network" "server_net" {
  name = "server-network"
}