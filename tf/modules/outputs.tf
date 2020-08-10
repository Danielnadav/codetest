output "endpoint_ip_address" {
value   = self.nic_list_status[0].ip_endpoint_list[0].ip
description = "endpoint_ip_address"
}