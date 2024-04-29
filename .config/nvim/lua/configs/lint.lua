require("lint").linters_by_ft = {
  lua = { "luacheck" },
  sh = { "shellcheck" },
  tex = { "lacheck" },
  yaml = { "yamllint" },
  javascript = { "biomejs" },
  typescript = { "biomejs" },
  json = { "biomejs" },
  elixir = { "credo" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
