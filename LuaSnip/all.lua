-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  s('math', { t '$', i(1), t '$' }),
  -- s('par', { t '{', i(1), t '}' }),
  -- ls.add_snippets(
  --   'tex',
  --   {
  --     s({ trig = '([%a]+)par', regTrig = true, wordTrig = false }, {
  --       f(function(_, snip)
  --         return snip.captures[1] .. '{}'
  --       end, {}),
  --       i(0),
  --     }),
  --   }
  -- ),
  s('{', { t '{', i(1), t '}' }),
  s('bra', { t '(', i(1), t ')' }),
  s('(', { t '(', i(1), t ')' }),
  s('brk', { t '[', i(1), t ']' }),
  s('[', { t '[', i(1), t ']' }),
  s('\\', { t '\\left', i(1), t '\\right' }),
  s('par', { t '{', i(1), t '}' }),
  s('Par', { t '\\left\\{', i(1), t '\\right\\}' }),
  s('Bra', { t '\\left(', i(1), t '\\right)' }),
  s('Brk', { t '\\left[', i(1), t '\\right]' }),
  s('frac', { t '\\frac{', i(1), t '}{', i(2), t '}' }),
  s('matrix', { t '\\begin{bmatrix}', i(1), t '\\end{bmatrix}' }),
  s('eqref', { t '\\eqref{', i(1), t '}' }),
  s('cite', { t '\\cite{', i(1), t '}' }),
  s('ref', { t '\\ref{', i(1), t '}' }),
}
