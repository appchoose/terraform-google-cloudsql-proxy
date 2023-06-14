variable "project" {
  description = "Project id"
  type        = string
}

variable "instance_name" {
  description = "Instance name"
  type        = string
}

variable "cos_image_family" {
  description = "The COS image family to use (eg: stable, beta, or dev)"
  type        = string
  default     = "stable"
}

variable "container_image" {
  description = "Source container image. Example : eu.gcr.io/cloudsql-docker/gce-proxy:1.32.0"
  type        = string
}

variable "container_args" {
  description = "Containers arguments."
  type        = list(string)
  default     = []
}

variable "container_command" {
  description = "Container command to start"
  type        = list(string)
  default     = ["/cloud_sql_proxy"]
}

variable "vm_machine_type" {
  description = "The machine type to create."
  type        = string
  default     = "e2-micro"
}

variable "firewall_network" {
  description = "The name or self_link of the network to attach this firewall to."
  type        = string
}

variable "firewall_source_ranges" {
  description = "The firewall will apply only to traffic that has source IP address in these ranges"
  type        = list(string)
}

variable "vm_subnetwork" {
  description = "The name or self_link of the subnetwork to attach this interface to."
  type        = string
  default     = null
}

variable "vm_network" {
  description = "The name or self_link of the network to attach this interface to."
  type        = string
  default     = null
}

variable "vm_zone" {
  description = "The zone that the machine should be created in"
  type        = string
  default     = null
}

variable "allow_public_ip" {
  description = "Generate an ephemeral public if true"
  type        = bool
  default     = false
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the vm."
  type        = map(string)
  default     = {}
}
