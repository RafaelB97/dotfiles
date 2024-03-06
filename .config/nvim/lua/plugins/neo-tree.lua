return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Keybinds for neo-tree
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

    require("neo-tree").setup({
      event_handlers = {
        {
          -- Auto close neo-tree when a file is open.
          event = "file_opened",
          handler = function(file_path)
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      },
      filesystem = {
        -- Show hidden files
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = true,
        }
      }
    })
  end
}
