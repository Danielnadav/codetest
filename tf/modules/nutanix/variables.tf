variable "nutanix_image_username" { 
    type = string
    default = "nutanix"
}
variable "nic_list" {
  type    = map
  default = {
  "nic_vlan_0" = "6cdd3209-c4f8-4f7d-b2f5-69a532868a0f"
  "devops" = "f050e6c0-11de-4176-a045-6fbce17a3f8d"
  "k8s-test" = "63c7fd5a-85ee-4856-946b-60586910f431"
  "vm-network" = "b1e5e010-b3b8-4029-a3da-b64f78c9b903"
  }
}




variable "nutanix_image_password" {
  type    = string
  default = "nutanix/4u"
}

variable "disk_list_uuid" {
  type = string
  default = "600a37c2-c4b1-4d11-a189-bad22c9b7f20"
}

variable "source_karbon_image" {
  type = string
  default = "https://192.168.133.120:9440/console/#page/explore/ebrowser/image_infos/karbon-centos7.5.1804-ntnx-0.6"
}
variable "karbon_image_name" {
  type    = string
  default = "karbon-centos7.5.1804-ntnx-0.6"
}

variable "prism_central_username" {
  type    = string
  default = "admin"
}
variable "password" {
  type    = string
  default = "Has0rd1m!@"
}


variable "karbon_version_name" {
  type    = string
  default = "karbon-centos7.5.1804-ntnx-0.6"
}

variable "nutanix_virtual_machine_name" {
    type = string
    default = "node01"
}

variable "amount_of_instances" {
  type = string
  default = 3
}


variable "num_vcpus_per_socket" {
    type = string
    default = "2"
}

variable "num_sockets" {
    type = string
    default = "1"
}

variable "memory_size_mib" {
    type = string
    default = "4096"
}
variable "ssh_type" {
    type = string
    default = "ssh"
}
variable "timeout" {
    type = string
    default = "6m"
}


# Name        UUID                                  State
# devops      f050e6c0-11de-4176-a045-6fbce17a3f8d  COMPLETE
# k8s-test    63c7fd5a-85ee-4856-946b-60586910f431  COMPLETE
# vlan.0      6cdd3209-c4f8-4f7d-b2f5-69a532868a0f  COMPLETE
# vm.network  b1e5e010-b3b8-4029-a3da-b64f78c9b903  COMPLETE