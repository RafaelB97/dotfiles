return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      {
        "<leader>w",
        group = "Windows",
        proxy = "<c-w>",
        -- expand = function ()
        --   return require('which-key.extras').expand.win()
        -- end
      },
    },
  },
  keys = {
    -- {
    --   "<leader>?",
    --   function()
    --     require("which-key").show({ global = false })
    --   end,
    --   desc = "Buffer Local Keymaps (which-key)",
    -- },
  },
}
