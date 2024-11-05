local linters = {
  -- text
  markdown = { "markdownlint" },
  yaml = { "yamllint" },
  json = { "biomejs" },
  -- programming
  javascript = { "biomejs" },
  typescript = { "biomejs" },
  -- web
  javascriptreact = { "biomejs" },
  typescriptreact = { "biomejs" },
  -- scripting
  sh = { "shellcheck" },
}

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = linters

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
