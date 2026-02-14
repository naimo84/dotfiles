-- Minimal Neovim config - simple text editor

-- Suppress treesitter warnings (no parsers installed)
vim.treesitter.start = function() end

-- Bootstrap lazy.nvim for colorscheme only
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
})

-- Basic options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = false

-- Statusline
opt.laststatus = 2
opt.statusline = "%f %h%w%m%r %=%l/%L "

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true

-- Clipboard (use system clipboard)
opt.clipboard:append("unnamedplus")

-- Splits
opt.splitright = true
opt.splitbelow = true

-- No swapfile
opt.swapfile = false

-- Basic keymaps
local keymap = vim.keymap

-- Leader key
vim.g.mapleader = " "

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Clear search highlight
keymap.set("n", "<Esc>", "<cmd>noh<CR><Esc>")

-- Save with Ctrl+s
keymap.set("n", "<C-s>", "<cmd>w<CR>")
keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>")
