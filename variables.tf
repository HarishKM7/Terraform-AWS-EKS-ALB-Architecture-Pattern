variable "cluster_name" {}
variable "vpc" {}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}
