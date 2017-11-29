package = 'deps'
version = 'scm-0'
source = {
  url = ''
}
dependencies = {
  'lapis',
	'lua ~> 5.1',
  'luacrypto'
}
build = {
  type = 'builtin',
  modules = {}
}
