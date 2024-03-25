pcall(function() vim.loader.enable() end)

vim.g.mapleader = [[ ]]
vim.g.localmapleader = [[ ]]

require("keymap")
require("o")
require("cmd")
require("global")
require("lazy-bootstrap")
