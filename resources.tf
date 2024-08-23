# Create a new VPC
resource "oci_core_virtual_cloud_network" "vcn" {
  compartment_id = var.compartment_ocid
  cidr_block      = "10.0.0.0/16"
  display_name    = "my-vcn"
  dns_label       = "myvcn"
}

# Create an Internet Gateway
resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id          = oci_core_virtual_cloud_network.vcn.id
  display_name    = "my-internet-gateway"
}

# Create a new subnet
resource "oci_core_subnet" "subnet" {
  compartment_id = var.compartment_ocid
  vcn_id          = oci_core_virtual_cloud_network.vcn.id
  cidr_block      = "10.0.1.0/24"
  display_name    = "my-subnet"
  dns_label       = "mysubnet"
  availability_domain = var.availability_domain
}

# Create a Dynamic Virtual Host (DVH)
resource "oci_core_dynamic_virtual_host" "dvh" {
  compartment_id = var.compartment_ocid
  vcn_id          = oci_core_virtual_cloud_network.vcn.id
  display_name    = "my-dvh"
}

# Create 10 compute instances
resource "oci_core_instance" "instance" {
  count            = 10
  compartment_id   = var.compartment_ocid
  availability_domain = var.availability_domain
  shape            = "VM.Standard2.1"
  display_name     = "my-instance-${count.index}"

  source_details {
    source_type = "image"
    image_id    = var.image_ocid
  }

  create_vnic_details {
    subnet_id          = oci_core_subnet.subnet.id
    assign_public_ip   = true
    display_name       = "my-vnic-${count.index}"
  }

  metadata = {
    ssh_authorized_keys = file(var.public_ssh_key_path)
  }
}
