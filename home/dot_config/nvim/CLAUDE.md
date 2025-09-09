# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration based on the "luna" theme/structure, using lazy.nvim as the plugin manager. The configuration follows a modular approach with plugins organized by functionality.

## Architecture

### Core Structure
- `init.lua` - Entry point that requires `luna.core` and `luna.lazy`
- `lua/luna/core/` - Core Neovim configuration (options, keymaps, spell settings)
- `lua/luna/plugins/` - Plugin configurations, organized by functionality
- `lua/luna/plugins/lsp/` - LSP-related plugins (mason, lspconfig, conform, nvim-lint, trouble)
- `lua/luna/lazy.lua` - Lazy.nvim setup and configuration

### Plugin Management
The configuration uses lazy.nvim with automatic plugin installation. Plugins are imported from:
- `luna.plugins` - General plugins
- `luna.plugins.lsp` - LSP-specific plugins

### Code Formatting and Linting
- **Formatter**: Uses conform.nvim with intelligent biome/prettier selection based on `.prettierrc` presence
- **Linter**: Uses nvim-lint for various file types
- **Style**: Uses stylua for Lua formatting (configured in `.stylua.toml`)

## Supported Languages and Tools

### Language Servers (via Mason)
- Lua (lua_ls with vim globals)
- YAML (yamlls)
- JSON (jsonls with schemastore)
- TOML (taplo)
- Typst (typst_lsp)
- Zig (zls)
- Rust (rust_analyzer)
- HTML, CSS, Svelte
- Bash (bashls)
- Docker (dockerls, docker_compose_language_service)
- Biome for JavaScript/TypeScript projects

### Formatters
- Lua: stylua
- JSON/JS/TS: biome or prettier (auto-detected)
- YAML/Markdown/HTML: prettier
- TOML: taplo
- Shell: shfmt
- SQL: sql_formatter
- TeX: latexindent
- Zig: zigfmt

## Key Configuration Details

### LSP Setup
LSP servers are automatically configured through mason-lspconfig with these special configurations:
- `lua_ls`: Configured with vim globals recognition
- `html`: Extended filetypes including "templ" and "heex"
- `jsonls`: Integrated with schemastore for JSON schema validation

### Key Mappings
- Leader key: Space
- Exit insert mode: `jk`
- Format file: `<leader>mp`
- LSP navigation: `gd`, `gR`, `gi`, `gt`
- Window splits: `<leader>sv` (vertical), `<leader>sh` (horizontal)
- Tab navigation: `<tab>` (next), `<S-tab>` (previous)

### Auto-formatting
Files are automatically formatted on save with a 1-second timeout and LSP fallback enabled.

## Development Commands

Since this is a Neovim configuration, there are no traditional build/test commands. However:

- **Lint Lua code**: `stylua --check .` (uses settings from `.stylua.toml`)
- **Format Lua code**: `stylua .`
- **Plugin management**: Use `:Lazy` command within Neovim to manage plugins

## File Organization Patterns

When adding new plugins:
- General plugins go in `lua/luna/plugins/`
- LSP-related plugins go in `lua/luna/plugins/lsp/`
- Each plugin should return a lazy.nvim plugin specification table
- Follow the existing pattern of event-based lazy loading where appropriate

## Mixed Configuration Warning

**IMPORTANT**: This configuration mixes Luna and NvChad systems, which can cause conflicts:

- **Luna system**: Uses `lua/luna/` directory with lazy.nvim
- **NvChad system**: Uses `lua/configs/`, `lua/plugins/init.lua`, and `lua/chadrc.lua`

### Issues and Fixes Applied:
1. **TypeScript LSP conflicts**: Both systems tried to configure TypeScript servers differently (tsserver vs ts_ls). **FIXED** - Disabled in both configurations to prevent conflicts.
2. **Invalid Typst LSP server**: `typst_lsp` was not a valid server name. **FIXED** - Commented out in Mason configuration.
3. **Telescope cache corruption**: Permission errors with cached Lua files. **FIXED** - Cache cleared from `~/.cache/nvim/luac/`.
4. **Deprecation warnings**: Some plugins use deprecated vim functions like `vim.tbl_add_reverse_lookup`. This is a plugin-level issue, not configuration.

### Recommended Approach:
- **Prioritize one system**: Either fully migrate to Luna or stick with NvChad
- **LSP Configuration**: Currently using Luna's mason.lua and lspconfig.lua, with NvChad's configs disabled
- **Plugin Management**: NvChad plugins are still loaded via `lua/plugins/init.lua`

### Troubleshooting:
- If you encounter cache-related errors, run: `rm -rf ~/.cache/nvim/luac/`
- For LSP server issues, verify server names match those in mason-lspconfig documentation
- Configuration should now start without errors