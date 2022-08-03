terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version =  ">= 0.13"
}

provider yandex {
  token     = " "
  cloud_id  = "b4skgvme2o8fsvjohk1c"
  folder_id = "b4svmrjec6nkm1l50njc"
  zone      = "default-ru-central1-a"
}

resource yandex_compute_image ubu-img {
  name          = "ubuntu-20-04-lts-v20210908"
  source_image  = "hd81hgrbv9lsekremf31"
}

resource "yandex_vpc_network" "net" {
  name = "tf-netology-vm"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.11.0/24"]
}

locals {
  instance = {
  stage = 1
  prod = 2
  }
}

resource "yandex_compute_instance" "vm-count" {
  name = "vm-${count.index}-${terraform.workspace}"

  resources {
    cores  = "2"
    memory = "2"
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.ubu-img.id}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  count = local.instance[terraform.workspace]
}

locals {
  id = toset([
    "1",
    "2",
  ])
}

resource "yandex_compute_instance" "vm-for" {
  for_each = local.id
  name = "vm-${each.key}-${terraform.workspace}"

  resources {
    cores  = "1"
    memory = "2"
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.ubu-img.id}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }
}
