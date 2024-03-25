local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('highlightyank', {})
autocmd('textyankpost', {
    group = yank_group,
    pattern = '*',
    callback = function()
      vim.highlight.on_yank({
        higroup = 'IncSearch',
        timeout = 80,
      })
    end,
})

local minifiles_augroup = augroup('my-mini-files', {})
autocmd('User', {
  group = minifiles_augroup,
  pattern = 'MiniFilesWindowOpen',
  callback = function(args)
    vim.api.nvim_win_set_config(args.data.win_id, { border = 'double' })
  end,
})

vim.cmd [[set whichwrap+=<,>,[,],h,l]]
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
