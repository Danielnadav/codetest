provider "nutanix" {
 username = "admin"
 password = "Has0rd1m!@"
 endpoint = "192.168.133.120"
 insecure = true
}

resource "nutanix_image" "CentOS-73.minimal" {
  name = "CentOS-7-x86_64-Everything-2003.iso"

  source_uri  = "http://rep-centos-il.upress.io/7.8.2003/isos/x86_64/CentOS-7-x86_64-Everything-2003.iso"
  # source_uri  = "http://cloud.centos.org/centos/7/images/CentOS-7-aarch64-GenericCloud-1606.qcow2.xz"
  # description = "heres a tiny linux image"
}





# resource "nutanix_virtual_machine" "vm" {
# cluster_uuid = "0005a661-2b3f-a7c8-7fe8-48df37c63c30"
# count = "3" 
# name = "master-${count.index + 1}"
#  description = "RKE Cluster"
#  num_vcpus_per_socket = 2
#  num_sockets          = 1
#  memory_size_mib      = 4096

#   }


resource "nutanix_virtual_machine" "vm" {
  name = "master-${count.index + 1}"
  count = "2" 
  cluster_uuid         = data.nutanix_clusters.clusters.entities.0.metadata.uuid
  num_vcpus_per_socket = 1
  num_sockets          = 1
  memory_size_mib      = 186
  power_state     = "ON"

  disk_list = [
      {
        data_source_reference = {
          kind = "image"
          uuid = "${nutanix_image.CentOS-7-x86_64-Everything-2003.iso}"
        }
      }


  ]

    # storage_config {
    #   storage_container_reference {
    #     kind = "storage_container"
    #     uuid = "0005a661-2b3f-a7c8-7fe8-48df37c63c30"
    #   }
    # }
  }


# resource "nutanix_image" "test" {
#   name        = "Ubuntu"
#   description = "Ubuntu"
#   source_uri  = "http://archive.ubuntu.com/ubuntu/dists/bionic/main/installer-amd64/current/images/netboot/mini.iso"
# }








