output "vcn_id" {
  value = oci_core_virtual_cloud_network.vcn.id
}

output "subnet_id" {
  value = oci_core_subnet.subnet.id
}

output "dvh_id" {
  value = oci_core_dynamic_virtual_host.dvh.id
}

output "instance_ids" {
  value = oci_core_instance.instance[*].id
}
