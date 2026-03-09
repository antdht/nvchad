---@diagnostic disable: unused-local
local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  -- Combining text and insert nodes to create basic LaTeX commands
  s({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}'" }, {
    t "\\texttt{", -- remember: backslashes need to be escaped
    i(1),
    t "}",
  }),
  -- Yes, these jumbles of text nodes and insert nodes get messy fast, and yes,
  -- there is a much better, human-readable solution: ls.fmt, described shortly.
  s({ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" }, {
    t "\\frac{",
    i(1), -- insert node 1
    t "}{",
    i(2), -- insert node 2
    t "}",
  }),
  -- Examples of Greek letter snippets, autotriggered for efficiency
  s({ trig = ";a", snippetType = "autosnippet" }, {
    t "\\alpha",
  }),
  s({ trig = ";b", snippetType = "autosnippet" }, {
    t "\\beta",
  }),
  s({ trig = ";g", snippetType = "autosnippet" }, {
    t "\\gamma",
  }),

  -- Glossaries package
  s({ trig = "nacr", dscr = "Expands 'nacr' into \\newacronym{}{}{}" }, {
    t "\\newacronym{",
    i(1),
    t "}{",
    i(2),
    t "}{",
    i(3),
    t "}",
  }),
  s({ trig = "facr", dscr = "Expands 'facr' into \\acrfull{}" }, { t "\\acrfull{", i(1), t "}" }),
  s({ trig = "lacr", dscr = "Expands 'lacr' into \\acrlong{}" }, { t "\\acrlong{", i(1), t "}" }),
  s({ trig = "sacr", dscr = "Expands 'sacr' into \\acrshort{}" }, { t "\\acrshort{", i(1), t "}" }),
}
