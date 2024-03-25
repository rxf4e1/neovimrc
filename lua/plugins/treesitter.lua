return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash", "lua", "rust", "c",
        "javascript", "typescript",
        "vimdoc",
      },
      auto_install = true,
      indent = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = {"markdown"},
      },
    })
  end,
}
