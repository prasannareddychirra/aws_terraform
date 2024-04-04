variable "subnet_ids" {
  type = list(string)
}

variable "instance_type" {
  type = list(string)
}

variable "node_group_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "desired_size" {
  type = number
}
variable "max_size" {
  type = number
}
variable "min_size" {
  type = number
}