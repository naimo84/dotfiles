local M = {}

M.opts = {
  ensure_installed = {
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
    -- tex
    "bibtex",
    "latex",
    -- programming
    "go",
    "zig",
    "javascript",
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
    -- database
    "sql",
    -- gRPC
    "proto",
    -- config
    "ssh_config",
  },
}

return M
