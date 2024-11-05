return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"

    -- Set header
    local greeting = [[
 .--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--. 
/ .. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \
\ \/\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ \/ /
 \/ /`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'\/ / 
 / /\   _____ _             ___  _   _ _____  __     ___                             / /\ 
/ /\ \ |_   _| |__   ___   / _ \| \ | | ____| \ \   / (_)_ __ ___                   / /\ \
\ \/ /   | | | '_ \ / _ \ | | | |  \| |  _|    \ \ / /| | '_ ` _ \                  \ \/ /
 \/ /    | | | | | |  __/ | |_| | |\  | |___    \ V / | | | | | | |                  \/ / 
 / /\    |_| |_| |_|\___|  \___/|_| \_|_____|    \_/  |_|_| |_| |_|                  / /\ 
/ /\ \                                                                              / /\ \
\ \/ /  _____       ____        _        _____ _                         _    _ _   \ \/ /
 \/ /  |_   _|__   |  _ \ _   _| | ___  |_   _| |__   ___ _ __ ___      / \  | | |   \/ / 
 / /\    | |/ _ \  | |_) | | | | |/ _ \   | | | '_ \ / _ \ '_ ` _ \    / _ \ | | |   / /\ 
/ /\ \   | | (_) | |  _ <| |_| | |  __/   | | | | | |  __/ | | | | |  / ___ \| | |  / /\ \
\ \/ /   |_|\___/  |_| \_\\__,_|_|\___|   |_| |_| |_|\___|_| |_| |_| /_/   \_\_|_|  \ \/ /
 \/ /                                                                                \/ / 
 / /\.--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--./ /\ 
/ /\ \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \/\ \
\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `' /
 `--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--' 
    ]]
    dashboard.section.header.val = greeting

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC e", "  > Open File Tree", "<cmd>NvimTreeFindFile<CR>"),
      dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
