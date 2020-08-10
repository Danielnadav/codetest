# module "node" {
#   source = "./nutanix"
#   name  = "node01"
#   description = "setup node"
# }


# provider "nutanix" {
#  username = var.nutanix_username
#  password = var.nutanix_password
#  endpoint = var.nutanix_endpoint
#  insecure = true
# }

data "nutanix_clusters" "clusters" {
}

locals {
  cluster1 = data.nutanix_clusters.clusters.entities[1].metadata.uuid
}

resource "nutanix_image" "centos" {
  name = var.karbon_image_name
  source_uri  = var.source_karbon_image
  description = "Centos Karbon image"
}
resource "nutanix_virtual_machine" "node01" {
  # General Information
  name                 = "node${count.index}"
  count = var.amount_of_instances
  description          = "K8s_centos_server"
  num_vcpus_per_socket = var.num_vcpus_per_socket
  num_sockets          = var.num_sockets
  memory_size_mib      = var.memory_size_mib
  cluster_uuid = local.cluster1

  
  nic_list {
    # subnet_reference is saying, which VLAN/network do you want to attach here?
    subnet_uuid = var.nic_list.nic_vlan_0

  }
  # What disk/cdrom configuration will this have?
  
  disk_list {
    data_source_reference = {
        kind = "image"
        uuid = var.disk_list_uuid
      }
  }

provisioner "file" {
  source      = "/Users/nadav/projects/tf/modules/nutanix/daemon.json"
  destination = "/tmp/daemon.json"
}
  connection {
    type        = var.ssh_type
    user        = var.nutanix_image_username
    password    = var.nutanix_image_password
    host        = self.nic_list_status[0].ip_endpoint_list[0].ip
    timeout = var.timeout
  }

  provisioner "remote-exec" {
    inline = [
      "cat /tmp/daemon.json | sudo tee /etc/docker/daemon.json",
      "sudo mkdir -p /var/nutanix",
      "sudo systemctl restart docker.service",
      "sudo docker pull cw-registry:5000/son_release_20.2/pgw:50",
    
    ]
  }
}




