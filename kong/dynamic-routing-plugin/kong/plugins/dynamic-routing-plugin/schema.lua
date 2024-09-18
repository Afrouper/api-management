local typedefs = require "kong.db.schema.typedefs"

return {
  name = "dynamic-routing-plugin",
  fields = {
    { config = {
        type = "record",
        fields = {
          -- Hier können weitere Konfigurationen hinzugefügt werden
        },
      },
    },
  },
}
