local lsp_servers = {
  -- defaults
  "lua_ls",
  -- text
  "yamlls",
  "jsonls",
  "taplo",
  -- typesetting
  -- "typst-lsp", -- temporarily disabled due to naming issues
  -- programming
  "zls",
  -- "typescript-language-server", -- temporarily disabled due to config issues
  "rust_analyzer",
  -- web
  "html",
  "cssls",
  "svelte",
  -- tools
  "autotools_ls",
  "dockerls",
  "docker_compose_language_service",
  "biome",
  -- scripting
  "bashls",
}

local tools = {
  -- formatters
  -- see conform plugin
  "stylua",
  "biome",
  "taplo",
  "latexindent",
  "shfmt",
  "sql-formatter",
  -- linters
  -- see nvim-lint plugin
  "markdownlint",
  "yamllint",
  "biome",
  "shellcheck",
}

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local mason_tool_installer = require "mason-tool-installer"

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }

    mason_lspconfig.setup {
      ensure_installed = lsp_servers,
    }

    mason_tool_installer.setup {
      ensure_installed = tools,
    }
  end,
}
