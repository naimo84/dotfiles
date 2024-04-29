require "nvchad.mappings"

local map = vim.keymap.set

-- Spell Checking
map("n", "<leader>sd", "<cmd>set spell spelllang=de_de<CR>", { desc = "Spell Check German" })
map("n", "<leader>se", "<cmd>set spell spelllang=en_us<CR>", { desc = "Spell Check English" })
map("n", "<leader>sx", "<cmd>set spell nospell<CR>", { desc = "Spell Check Disable" })

-- YAML Companion
map("n", "<leader>ys", "<cmd>Telescope yaml_schema<CR>", { desc = "YAML Select Schema" })

-- Git
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Git LazyGit" })
map("n", "<leader>gs", "<cmd>AdvancedGitSearch<CR>", { desc = "Git Advanced Search" })

-- Gopher
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Go Add JSON struct tags" })
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "Go Add YAML struct tags" })

-- Glow
map("n", "<leader>gl", "<cmd>Glow<CR>", { desc = "Markdown Preview" })
