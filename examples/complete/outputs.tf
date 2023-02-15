
output "backend_config" {
  value = {
    parent = module.state_resources_parent.backend_config
    child  = module.state_resources_child.backend_config
  }
}
