local config = require 'lapis.config'

config('development', {
  port = 8086,
  postgres = {
    password = 'awesome',
    database = 'lapis'
  }
})
