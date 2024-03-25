return {
  'echasnovski/mini.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  -- init = function()
  --   require('mini.statusline').setup {}
  -- end,

  config = function()
    require("mini.bracketed").setup {}
    require("mini.bufremove").setup {}
    require("mini.extra").setup {}
    require('mini.files').setup {}
    local hipatterns = require('mini.hipatterns')
    hipatterns.setup { highlighters = {hex_color = hipatterns.gen_highlighter.hex_color(),}}
    -- require("mini.hues").setup {}
    require('mini.move').setup {}
    require('mini.notify').setup {window = { config = { border = 'double' }} }
    require('mini.pick').setup {window = { config = { border = 'double' }} }
    require('mini.trailspace').setup {}
  end,

  main = "mini.nvim",

  keys = {
    -- buffer
    { "<leader>ba", ":b#<CR>", desc = "Buffer Alternate" },
    { "<leader>bd", ":lua MiniBufremove.delete()<CR>", desc = "Buffer Delete" },
    { "<leader>bD", ":lua MiniBufremove.delete(0, true)", desc = "Buffer Delete!" },
    { "<leader>bf", ":Pick buffers<CR>", desc = "Buffer Find" },
    { "<leader>bs", ":lua Config.new_scratch_buf()<CR>", desc = "Buffer Open Scratch" },
    { "<leader>bw", ":lua MiniBufremove.wipeout()<CR>", desc = "Buffer Wipeout" },
    { "<leader>bW", ":lua MiniBufremove.wipeout(0, true)<CR>", desc = "Buffer Wipeout!" },

    -- explorer
    { "<leader>ec", ":lua MiniFiles.open(vim.fn.stdpath('config'))<CR>", desc = "Config" },
    { "<leader>ed", ":lua MiniFiles.open()<CR>", desc = "Directory" },
    { "<leader>ef", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", desc = "File Directory" },
    { "<leader>ei", ":edit $MYVIMRC<CR>", desc = "MYVIMRC" },

    -- fuzzy
    { "<leader>ff", ":Pick files<CR>", desc = "Find Files" },
    { "<leader>fg", ":Pick grep_live<CR>", desc = "Grep Live" },
    { "<leader>fG", ":Pick grep pattern='<cword>'<CR>", desc = "Grep current word" },
    { "<leader>fh", ":Pick help<CR>", desc = "Help Tags" },
    { "<leader>fH", ":Pick hl_groups<CR>", desc = "Highlight Groups" },
    { "<leader>fl", ":Pick buf_lines scope='current'<CR>", desc = "Buffer Lines (current)" },
    { "<leader>fL", ":Pick buf_lines scope='all'<CR>", desc = "Buffer Lines (All)" },
    { "<leader>fr", ":Pick resume<CR>", desc = "Resume" },

    -- git
    { "<leader>gg", ":lua Config.open_lazygit()<CR>", desc = "Git Tab" },
    -- { "<leader>g", ":", desc = "" },
    -- { "<leader>g", ":", desc = "" },
    -- { "<leader>g", ":", desc = "" },

    -- others
    { "<leader>oh", ":normal gxiagxila<CR>", desc = "Move arg Left" },
    { "<leader>oH", ":TSBufToggle Highlight<CR>", desc = "Highlight Toggle" },
    { "<leader>ol", ":normal gxiagxina<CR>", desc = "Move arg Right" },
    { "<leader>ot", ":lua MiniTrailspace.trim()<CR>", desc = "Whitespace Trim" },
  },

}
