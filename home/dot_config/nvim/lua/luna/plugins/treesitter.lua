-- ensure these language parsers are installed
local languages = {
  -- defaults
  "vim",
  "lua",
  -- text
  "markdown",
  "json",
  "json5",
  "xml",
  "yaml",
  "toml",
  "csv",
  "kdl",
  -- typesetting
  "bibtex",
  "latex",
  "typst",
  -- programming
  "go",
  "zig",
  "javascript",
  "jsdoc",
  "typescript",
  "elixir",
  "rust",
  -- web
  "html",
  "css",
  "svelte",
  "vue",
  "heex",
  -- tools
  "gomod",
  "gosum",
  "make",
  "dockerfile",
  -- scripting
  "bash",
  -- vcs
  "gitignore",
  "gitattributes",
  "gitcommit",
  "git_config",
  "git_rebase",
  -- database
  "sql",
  -- gRPC
  "proto",
  -- config
  "ssh_config",
  "gpg",
}

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require "nvim-treesitter.configs"

    -- configure treesitter
    treesitter.setup { -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      ensure_installed = languages,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    }
  end,
}
