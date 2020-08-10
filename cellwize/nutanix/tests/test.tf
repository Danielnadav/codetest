provider "nutanix" {
 username = "admin"
 password = "Has0rd1m!@"
 endpoint = "192.168.133.120"
 insecure = true
}


resource "nutanix_virtual_machine" "MyTestVM_TF" {
 name = "MyTestVM-TF"
 description = "Created with Terraform"
 provider = nutanix
 cluster_uuid = "0005a661-2b3f-a7c8-7fe8-48df37c63c30"
  num_vcpus_per_socket = 1
  num_sockets = 1
  memory_size_mib = 2048
  
  # nic_list {
  #    # subnet_reference is saying, which VLAN/network do you want to attach here?
  #    subnet_uuid = "63c7fd5a-85ee-4856-946b-60586910f431"
  #  }

  disk_list {
  # data_source_reference in the Nutanix API refers to where the source for
  # the disk device will come from. Could be a clone of a different VM or a
  # image like we're doing here
  data_source_reference = {
   kind = "image"
   uuid = "cf0116c3-0bc3-48d8-bbec-3fb6961aec9d"
    }

  device_properties {
    disk_address = {
   device_index = 0
   adapter_type = "IDE"
    }

    device_type = "DISK"
  }
   }

  disk_list {
  # defining an additional entry in the disk_list array will create another.
  #disk_size_mib and disk_size_bytes must be set together.
  disk_size_mib   = 100
  disk_size_bytes = 104857
   }
}  
  
output "ip_address" {
  value = nutanix_virtual_machine.MyTestVM_TF.nic_list_status.0.ip_endpoint_list[0]["ip"]
}