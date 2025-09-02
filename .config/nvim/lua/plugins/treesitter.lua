return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
         incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>", -- set to `false` to disable one of the mappings
            node_incremental = "<C-scpace>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end
  }
}
