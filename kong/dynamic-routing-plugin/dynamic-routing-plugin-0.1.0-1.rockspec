package = "dynamic-routing-plugin"
version = "0.1.0-1"
source = {
  url = "git://github.com/Afrouper/api-management",
}

description = {
  summary = "Provides dynamic selection of a Service",
  detailed = [[
    This plugin dynamically routes requests based on a path element.
  ]],
  homepage = "https://github.com/Afrouper/api-management",
  license = "Apache-2.0"
}

dependencies = {
  "kong >= 3.0.0",
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.my-plugin.handler"] = "kong/plugins/dynamic-routing-plugin/handler.lua",
    ["kong.plugins.my-plugin.schema"] = "kong/plugins/dynamic-routing-plugin/schema.lua",
  }
}