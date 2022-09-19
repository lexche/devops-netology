variable "YANDEX_TOKEN" {
    default = "AQAAAABhyebtAATuwashW4O2Kkf0k2-gbxEUC5E"
}

variable "yandex_folder_id" {
  default = "b1gp4h877cr12auet6m3"
}

variable "yandex_cloud_id" {
  default = "b1g526c4rjmu61cgf7d8"
}

variable "SSH_ID_RSA_PUB" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDv5FFxTcyDvRMjW4Z2AHnt7Kt/6DVPVH9CDR6GqIK6QdqfIKnQ2HH+F/tdh0ygd1wz/KF2zpCyC7XaGUGMhZF4JsAoesTsAPwR1E1ILE86GcHkBHriz2Q/wFf8/LPyd6ahojtAZ4NdTTjpYCpckrRbsoouQE973fJKG/WiUelB60TAsWl4DVJOKYC0HGifTthdh+nIlZiQWZucDyC4Lh3+BvDJe61gPjnYQhbeMnf8F0wZtdwg3L7KTUzm9d2/PQJYbUiC3zlg/+ECbpPlb6L85q6pvBVjk/KZVXWIwEby7HMGNaZ+q+vegL5cE7XwutChMIr9G4L70ptomdR0S3LuBB1VoGuVtVHpF1zyonqOkbfieX2gwlh3KWcVRzAAFMKP1BdYssmP9os8No4oF3HScjmor0kTSDt0udPD/uR6J0VXb9olOu+N0JvQEb4l2GCdruR5GAXhXuZdT75hEUcJdI33ug3KZ8PavfxdhLOT8koE969Ko5iwSNHLk1LVQMk= root@itpbt001"
}

variable "cidrs" {
  type = list(string)
  default = ["172.16.10.0/24", "172.16.20.0/24"]
}
variable "zones" {
  type = list(string)  
  default = ["ru-central1-a"]
}

variable "ubu" {
  default = "fd87tirk5i8vitv9uuo1"
}

variable "vm" {
  type = list(string)
  default = ["lexanar.ru", "db01.lexanar.ru", "db02.lexanar.ru", "app.lexanar.ru", "gitlab.lexanar.ru", "runner.lexanar.ru", "monitoring.lexanar.ru"]
}