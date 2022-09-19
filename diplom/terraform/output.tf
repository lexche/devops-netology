output "entrance_lexanar_ru_ip_addr_external" {
  value = yandex_compute_instance.entrance_instance.network_interface.0.nat_ip_address
}

output "db01_lexanar_ru_ip_addr_internal" {
  value = yandex_compute_instance.db01_instance.network_interface.0.ip_address
}

output "db02_lexanar_ru_ip_addr_internal" {
  value = yandex_compute_instance.db02_instance.network_interface.0.ip_address
}

output "app_lexanar_ru_ip_addr_internal" {
  value = yandex_compute_instance.app_instance.network_interface.0.ip_address
}

output "monitoring_lexanar_ru_ip_addr_internal" {
  value = yandex_compute_instance.monitoring_instance.network_interface.0.ip_address
}

output "gitlab_lexanar_ru_ip_addr_internal" {
  value = yandex_compute_instance.gitlab_instance.network_interface.0.ip_address
}

output "runner_lexanar_ru_ip_addr_internal" {
  value = yandex_compute_instance.runner_instance.network_interface.0.ip_address
}

output "ssh_config" {
  value = <<-EOT
  Host lexanar.ru
    HostName ${yandex_compute_instance.entrance_instance.network_interface.0.nat_ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa

  Host db01.lexanar.ru
    HostName ${yandex_compute_instance.db01_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host db02.lexanar.ru
    HostName ${yandex_compute_instance.db02_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host app.lexanar.ru
    HostName ${yandex_compute_instance.app_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host monitoring.lexanar.ru
    HostName ${yandex_compute_instance.monitoring_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host gitlab.lexanar.ru
    HostName ${yandex_compute_instance.gitlab_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host runner.lexanar.ru
    HostName ${yandex_compute_instance.runner_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  EOT
}