local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}

keymap("n", "<C-i>", "<C-i>", opts)

keymap("n", "<leader>ee", ":Lex<CR>", {desc = "File Explore"})

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "*", "zzzv", opts)
keymap("n", "#", "#zzzv", opts)
keymap("n", "g*", "g*zzzv", opts)
keymap("n", "g#", "g#zzzv", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-x>", ":bd<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- keymap("v", "<M-j>", ":m '>+1<CR>gv=gv'", opts)
-- keymap("v", "<M-k>", ":m '<-2<CR>gv=gv'", opts)

keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- greatest remap ever
keymap("v", "p", '"_dP', opts)

keymap("n", "<Esc>", ":nohlsearch<CR>", opts)
keymap("n", "Q", ":nohlsearch<CR>", opts)
keymap("i", "jk", "<Esc>", opts)
keymap("i", "kj", "<Esc>", opts)
