_G.Config.leader_group_clues = {
  { mode = "n", keys = "<leader>b", desc = "[B]uffer" },
  { mode = "n", keys = "<leader>e", desc = "[E]xplore" },
  { mode = "n", keys = "<leader>f", desc = "[F]uzzy" },
  { mode = "n", keys = "<leader>g", desc = "[G]it" },
  { mode = "n", keys = "<leader>l", desc = "[L]sp" },
  { mode = "n", keys = "<leader>o", desc = "[O]ther" },
}

return {
  "echasnovski/mini.clue",
  event = "VimEnter",
  config = function()
    local miniclue = require("mini.clue")
    miniclue.setup {
      clues = {
        Config.leader_group_clues,
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows({submode_resize = true}),
        miniclue.gen_clues.z(),
      },
      triggers = {
        { mode = "n", keys = "<leader>" },
        { mode = "x", keys = "<leader>" },
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },
        { mode = "x", keys = "[" },
        { mode = "x", keys = "]" },
        { mode = "i", keys = "<C-x>" },
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },
        { mode = "n", keys = "<C-w>" },
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },
      window = { config = {border = "double"}},
    }
  end,
}
