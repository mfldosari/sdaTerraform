output "public_ip_address" {
  value = module.network.public_ip_address
}

output "sas_url_query_string" {
  value = module.storage.sas_url_query_string
}

output "postgresql_server_endpoint" {
  value = module.database.postgresql_server_endpoint
}

