local M = {}

M.opts = {
  ensure_installed = {
    -- Lua
    "lua-language-server",
    "stylua",
    "luacheck",
    -- Shell
    "shfmt",
    "shellcheck",
    -- TeX
    "texlab",
    "latexindent",
    -- YAML
    "yaml-language-server",
    "yamllint",
    -- JSON
    "json-lsp",
    -- Go
    "gopls",
    -- Zig
    "zls",
    -- JavaScript & TypeScript
    "typescript-language-server",
    "biome",
    -- Web
    "html-lsp",
    "css-lsp",
    "htmx-lsp",
    "vue-language-server",
    "svelte-language-server",
    -- Formatter
    "prettier",
    -- Elixir
    "elixir-ls",
    -- Make
    "autotools-language-server",
    -- Container
    "helm-ls",
    "dockerfile-language-server",
    "docker-compose-language-service",
    -- TOML
    "taplo",
    -- Rust
    "rust-analyzer",
  },
}

return M
