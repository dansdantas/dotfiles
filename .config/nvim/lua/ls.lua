local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("lua", {
  s(
    "lreq",
    fmt([[local {} = require("{}")]], {
      f(function(import_name)
        local parts = vim.split(import_name[1][1], ".", { plain = true })
        return parts[#parts] or ""
      end, { 1 }),
      i(1),
    })
  ),
})

ls.add_snippets("all", {
  s("todo", {
    c(1, {
      t("TODO(dansdantas): "),
      t("FIXME(dansdantas): "),
      t("TODONT(dansdantas): "),
      t("TODO(anybody please help me): "),
    }),
  }),

  s(
    "ctime",
    f(function()
      return os.date("%D - %H:%M")
    end)
  ),
})
