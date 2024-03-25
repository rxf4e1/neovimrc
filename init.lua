pcall(function() vim.loader.enable() end)

vim.g.mapleader = [[ ]]
vim.g.localmapleader = [[ ]]

require("keymap")
require("opts")
require("aucmds")
require("global")
require("lazy-bootstrap")
