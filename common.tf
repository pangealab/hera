locals {
  common_prefix = var.cluster-name
  elk_domain = "${local.common_prefix}-elk-domain"
}

data "aws_caller_identity" "current" {}