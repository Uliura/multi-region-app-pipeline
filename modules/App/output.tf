output "webapp_ips" {
  value = azurerm_windows_web_app.webapp.outbound_ip_addresses
}