local config = require 'lapis.config'

config({ 'development', 'production' }, {
  postgres = {
    password = 'awesome',
    database = 'lapis'
  }
})

config('development', {
  port = 8086
})

config('production', {
  port = 80,
  lua_code_cache = true
})
