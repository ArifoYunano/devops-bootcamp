output "rackula_url" {
  description = "Working Rackula URL"
  value       = "http://${module.rackula_server.public_ip}:${var.rackula_port}"
}

output "ssm_command" {
  description = "SSM Session Manager command with the server id"
  value       = "aws ssm start-session --target ${module.rackula_server.id}"
}