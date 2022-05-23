output "app_fqdn" {
    value = azurerm_linux_web_app.webapp.default_hostname
}