resource "exoscale_security_group" "cluster" {
  name        = "cluster"
  description = "cluster-exoscale"
}

resource "exoscale_security_group_rule" "accept-internal" {
  security_group = "${exoscale_security_group.cluster.id}"

  type = "INGRESS"

  protocol = "TCP"
  cidr = "0.0.0.0/0"

  start_port = "${element(var.nomad_ports, count.index)}"
  end_port = "${length(var.nomad_ports)}"
}
