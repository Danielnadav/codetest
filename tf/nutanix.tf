
# variable "nutanix_endpoint" {
#   type    = string
# }

module "nutanix_virtual_machine" {
  source = "./modules/nutanix"
}


provider "nutanix" {
 username = var.prism_central_username
 password = var.prism_central_password
 endpoint = var.nutanix_endpoint
 insecure = true
}

# provider "nutanix" {
#  username = "admin"
#  password = "Has0rd1m!@"
#  endpoint = "192.168.133.120"
#  insecure = true
# }
data "nutanix_clusters" "clusters" {
}

locals {
  cluster1 = data.nutanix_clusters.clusters.entities[1].metadata.uuid
}

# resource "nutanix_image" "test" {
#   name = "karbon-centos7.5.1804-ntnx-0.6"
#   source_uri  = "https://192.168.133.120:9440/console/#page/explore/ebrowser/image_infos/karbon-centos7.5.1804-ntnx-0.6"
#   description = "Centos Karbon image"
# }
# resource "nutanix_virtual_machine" "demo-01-web" {
#   # General Information
#   name                 = "demo-01-web"
#   description          = "centos server"
#   num_vcpus_per_socket = 2
#   num_sockets          = 1
#   memory_size_mib      = 4096
#   # What cluster will this VLAN live on?
#   cluster_uuid = local.cluster1

  
#   nic_list {
#     # subnet_reference is saying, which VLAN/network do you want to attach here?
#     subnet_uuid = "6cdd3209-c4f8-4f7d-b2f5-69a532868a0f"

#   }
#   # What disk/cdrom configuration will this have?
#   disk_list {

#     data_source_reference = {
#         kind = "image"
#         uuid = "600a37c2-c4b1-4d11-a189-bad22c9b7f20"
#       }
#   }

# provisioner "file" {
#   source      = "/Users/nadav/projects/tf/daemon.json"
#   destination = "/tmp/daemon.json"
# }
#   connection {
#     type        = "ssh"
#     user        = "nutanix"
#     password    = "nutanix/4u"
#     host        = self.nic_list_status[0].ip_endpoint_list[0].ip
#     timeout = "6m"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "cat /tmp/daemon.json | sudo tee /etc/docker/daemon.json",
#       "sudo mkdir -p /var/nutanix",
#       "sudo systemctl restart docker.service",
#       "sudo docker pull cw-registry:5000/son_release_20.2/pgw:50"
    
#     ]
#   }
# }




