local lapis = require 'lapis'
local Model = require 'lapis.db.model'.Model
local validate = require 'lapis.validate'
local capture_errors = require 'lapis.application'.capture_errors

local app = lapis.Application()
app:enable('etlua')
app.layout = require 'views.layout'

local bookmarks = Model:extend('bookmarks')

app:get('index', '/', function(self)
  return { redirect_to = self:url_for('view') }
end)

app:get('view', '/view', function(self)
  self.error_message = self.params.error
  self.bookmarks = bookmarks:select()
  return { render = true }
end)

app:get('bookmarks', '/bookmarks', function(self)
  return { json = bookmarks:select() }
end)

app:post('/add', capture_errors({
  on_error = function(self)
    local view = self:url_for('view', nil, { error = self.errors[1] })
    return { redirect_to = view }
  end,

  function(self)
    validate.assert_valid(self.params, {
      { 'name', exists = true, type = 'String', min_length = 2 },
      { 'url', exists = true, type = 'String', min_length = 2 }
    })
    bookmarks:create(self.params)
    return { redirect_to = self:url_for('view') }
  end
}))

app:post('/delete/:id', function(self)
  bookmarks:find(self.params.id):delete()
end)

return app
