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