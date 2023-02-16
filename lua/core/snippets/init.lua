ls = require("luasnip")
s = ls.snippet
sn = ls.snippet_node
isn = ls.indent_snippet_node
t = ls.text_node
i = ls.insert_node
f = ls.function_node
c = ls.choice_node
d = ls.dynamic_node
r = ls.restore_node
events = require("luasnip.util.events")
ai = require("luasnip.nodes.absolute_indexer")
extras = require("luasnip.extras")
l = extras.lambda
rep = extras.rep
p = extras.partial
m = extras.match
n = extras.nonempty
dl = extras.dynamic_lambda
fmt = require("luasnip.extras.fmt").fmt
fmta = require("luasnip.extras.fmt").fmta
conds = require("luasnip.extras.expand_conditions")
postfix = require("luasnip.extras.postfix").postfix
types = require("luasnip.util.types")
parse = require("luasnip.util.parser").parse_snippet

-- Repeat Insernode text
-- @param insert_node_id The id of the insert node to repeat (the first line from)
ri = function (insert_node_id)
    return f(function (args) return args[1][1] end, insert_node_id)
end

require('core.snippets.c')
require('core.snippets.makefile')
require('core.snippets.lua')
