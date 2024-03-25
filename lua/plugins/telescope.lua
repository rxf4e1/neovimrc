return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  enabled = false,
  config = function()
    require("telescope").setup {}

    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find File"})
    vim.keymap.set('n', '<leader>fG', builtin.git_files, {desc = "Git File"})
    vim.keymap.set('n', '<leader>fg', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, {desc = "Grep"})
    vim.keymap.set('n', '<leader>ft', builtin.help_tags, {desc = "Help Tags"})
  end,
}
