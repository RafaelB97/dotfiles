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
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Neotree toggle" })
		vim.keymap.set("n", "<leader>ge", ":Neotree toggle source=git_status<CR>", { desc = "Neotree Git Status toggle" })

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
      },
      window = {
        mappings = {
          ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
          ['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
          ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
        },
      },
    })
  end
}
