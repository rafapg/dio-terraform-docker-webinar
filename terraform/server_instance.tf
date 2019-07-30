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
    network       = "default"
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

  provisioner "remote-exec" {
    inline = ["cd /home/${var.user}",
      "chmod +x /home/${var.user}/*.sh",
      "./bootstrap.sh",
    ]
  }
  provisioner "remote-exec" {
    inline = ["cd /home/${var.user}",
      "chmod +x /home/${var.user}/*.sh",
      "./setup_instance.sh",
    ]
  }
}
