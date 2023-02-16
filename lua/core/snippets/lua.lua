ls.add_snippets('lua', {
  s({
    name = "local require",
    trig = "req",
    dscr = "simple lua require"
  },
    fmt("local {} = require('{}')",
      {
        i(1, "default"),
        ri(1),
      }
    )
  )
})
