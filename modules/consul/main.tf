variable "server_count" {
  default     = "1"
  description = "The number of Consul servers to launch."
}

resource "exoscale_compute" "consul-${var.server_count}" {
  zone         = "ch-dk-2"
  display_name = "consul-${var.server_count}"
  template     = "Linux Debian 9 64-bit"
  size         = "Tiny"
  disk_size    = 10
  state        = "Running"

  affinity_groups = []
  security_groups = ["default"]

  ip6 = false

  tags = {
    production = "true"
  }

  timeouts {
    create = "60m"
    delete = "2h"
  }

}