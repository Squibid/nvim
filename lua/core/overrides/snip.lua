local ls = require('luasnip')

ls.config.set_config {
  -- return back into snippet
  history = true,

  -- update on text insert
  updateevents = "TextChanged,TextChangedI"
}
