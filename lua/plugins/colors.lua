local function setColor(color)
  color = color or "randomhue"
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require("tokyonight").setup {
        style = "storm",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "dark",
          floats = "dark",
        },
      }
    end,
  },

  {
    'behemothbucket/gruber-darker-theme.nvim',
    priority = 1000,
    lazy = false,
  },

  {
    'rose-pine/neovim',
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "moon",
        disable_background = true,
      })
      setColor("gruber-darker")
    end,
    -- init = function() vim.cmd.colorscheme "rose-pine" end,
  },

}
