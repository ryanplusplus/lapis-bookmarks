package = 'deps'
version = 'dev-0'
source = {
   url = 'https://lua.org/extras/5.3/strict.lua'
}
dependencies = {
  'cqueues',
  'http',
  'lapis',
  'lua ~> 5.1',
  'luacrypto'
}
build = {
   type = 'none'
}
