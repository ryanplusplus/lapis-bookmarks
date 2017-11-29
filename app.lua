local lapis = require 'lapis'
local Model = require 'lapis.db.model'.Model

local app = lapis.Application()
app:enable('etlua')
app.layout = require 'views.layout'

local bookmarks = Model:extend('bookmarks')

app:get('index', '/', function(self)
  return { redirect_to = self:url_for('view') }
end)

app:get('view', '/view', function(self)
  self.bookmarks = bookmarks:select()
  return { render = true }
end)

app:get('bookmarks', '/bookmarks', function(self)
  return { json = bookmarks:select() }
end)

app:post('/add', function(self)
  bookmarks:create(self.params)
  return { redirect_to = self:url_for('view') }
end)

app:post('/delete/:id', function(self)
  bookmarks:find(self.params.id):delete()
end)

return app
