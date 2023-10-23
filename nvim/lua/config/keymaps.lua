-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

wk.register({
  h = {
    name = "Harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file" },
    r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", "Remove file" },
    h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Menu" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next file" },
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous file" },
    ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Go to Harpoon Mark 1" },
    ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Go to Harpoon Mark 2" },
    ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Go to Harpoon Mark 3" },
    ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Go to Harpoon Mark 4" },
    ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Go to Harpoon Mark 5" },
    ["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Go to Harpoon Mark 6" },
    ["7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "Go to Harpoon Mark 7" },
    ["8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "Go to Harpoon Mark 8" },
    ["9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "Go to Harpoon Mark 9" },
  },
})
