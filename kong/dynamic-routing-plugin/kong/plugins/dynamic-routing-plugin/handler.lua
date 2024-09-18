local BasePlugin = require "kong.plugins.base_plugin"
local MyDynamicRoutingPlugin = BasePlugin:extend()

function MyDynamicRoutingPlugin:new()
  MyDynamicRoutingPlugin.super.new(self, "dynamic-routing-plugin")
end

function MyDynamicRoutingPlugin:access(conf)
  MyDynamicRoutingPlugin.super.access(self)

  local uri = ngx.var.uri
  local service_name = uri:match("/service/([^/]+)")

  if service_name then
    -- Dynamisch den Host basierend auf dem Servicenamen setzen
    ngx.ctx.balancer_address.host = service_name .. ".example.com"
  end
end

return MyDynamicRoutingPlugin
