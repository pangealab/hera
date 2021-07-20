#
# Variables Configuration
#

variable "cluster-name" {
  default = "hera"
  type    = string
}

variable "elasticsearch_version" {
  default = "7.10"
  type    = string
}

variable "master_user_name" {
  type    = string
}

variable "master_user_password" {
  type    = string
}