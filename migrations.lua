local schema = require 'lapis.db.schema'
local types = schema.types

return {
  [1] = function()
    schema.create_table('bookmarks', {
      { 'id', types.serial },
      { 'name', types.text },
      { 'url', types.text },

      'PRIMARY KEY (id)'
    })
  end
}
