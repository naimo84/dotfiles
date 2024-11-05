local function biome_or_prettier()
  if vim.fn.filereadable ".prettierrc" == 1 then
    return { "prettier" }
  else
    return { "biome" }
  end
end

local formatters = {
  -- defaults
  lua = { "stylua" },
  -- text
  markdown = { "prettier" },
  json = biome_or_prettier,
  jsonc = biome_or_prettier,
  toml = { "taplo" },
  yaml = { "prettier" },
  -- typesetting
  tex = { "latexindent" },
  -- programming languages  
  zig = { "zigfmt" },
  javascript = biome_or_prettier,
  typescript = biome_or_prettier,
  -- web
  html = { "prettier" },
  css = biome_or_prettier,
  javascriptreact = biome_or_prettier,
  typescriptreact = biome_or_prettier,
  svelte = { "prettier" },
  vue = { "prettier" },
  -- scripting
  sh = { "shfmt" },
  -- database
  sql = { "sql_formatter" },
  -- other
  ["*"] = { "trim_whitespace" },
}

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      formatters_by_ft = formatters,
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    }

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
