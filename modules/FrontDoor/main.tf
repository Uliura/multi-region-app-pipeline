resource "azurerm_frontdoor" "frontdoor" {
  name                = "geka-frontend-endpoint-test"
  resource_group_name = var.resource_group_name

  routing_rule {
    name               = "RoutingRule"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["geka-frontend-endpoint-test"]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "Backend"
    }
  }

  backend_pool_load_balancing {
    name = "LoadBalancingSettings"
  }

  backend_pool_health_probe {
    name = "HealthProbeSetting"
    
  }
  backend_pool_settings {
    enforce_backend_pools_certificate_name_check = true
  }
  
  backend_pool {
    name = "Backend"
    backend {
      host_header = "gekamultiappeus.azurewebsites.net"
      address     = "gekamultiappeus.azurewebsites.net"
      http_port   = 80
      https_port  = 443
    }
    backend {
      host_header = "gekamultiappcus.azurewebsites.net"
      address     = "gekamultiappcus.azurewebsites.net"
      http_port   = 80
      https_port  = 443
    }
 
    load_balancing_name = "LoadBalancingSettings"
    health_probe_name   = "HealthProbeSetting"
  }

  frontend_endpoint {
    name      = "geka-frontend-endpoint-test"
    host_name = "geka-frontend-endpoint-test.azurefd.net"
  }
}
