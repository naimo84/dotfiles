-- Disable spellfile plugin
vim.g.loaded_spellfile_plugin = 1

--- Download missing spellfiles
local function download_spell_files(lang)
  local ftp = "http://ftp.vim.org/vim/runtime/spell/"
  local spl_file = lang .. ".utf-8.spl"
  local sug_file = lang .. ".utf-8.sug"
  local config_dir = vim.fn.stdpath "config" .. "/spell/"

  vim.fn.system { "mkdir", "-p", config_dir }

  vim.notify("Downloading " .. spl_file)
  vim.fn.system {
    "curl",
    "-o",
    config_dir .. spl_file,
    ftp .. spl_file,
  }

  vim.notify("Downloading " .. sug_file)
  vim.fn.system {
    "curl",
    "-o",
    config_dir .. sug_file,
    ftp .. sug_file,
  }
end

local spell_augroup = vim.api.nvim_create_augroup("spell", { clear = true })
vim.api.nvim_create_autocmd({ "SpellFileMissing" }, {
  group = spell_augroup,
  callback = function()
    local lang = vim.fn.expand "<amatch>"
    download_spell_files(lang)
  end,
})

-- Set keymaps to enable spell checking
local map = vim.keymap.set
map("n", "<leader>ze", "<cmd>set spell spelllang=en_us<CR>", { desc = "Enable spell checking for english" })
map("n", "<leader>zd", "<cmd>set spell spelllang=de_de<CR>", { desc = "Enable spell checking for german" })
map("n", "<leader>zx", "<cmd>set nospell<CR>", { desc = "Disable spell checking" })
