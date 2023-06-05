terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host     = "ssh://jjj72@lamarr.ebme.case.edu"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

resource "docker_image" "ray" {
  name         = "rayproject/ray"
  keep_locally = false

}

resource "docker_container" "rc" {
  image   = docker_image.ray.image_id
  name    = "ray_child_container"
  command = ["tail", "-f", "/dev/null"]#["ray", "start", "--address=192.168.1.22:6379"]

  # # Run a bash script inside the container on startup
  # command = ["bash", "-c", "ray start --address=192.168.1.22:6379"]

  ports {
    internal = 80
    external = 8050
  }
}