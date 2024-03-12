return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    -- Find
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find word" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })

    -- Git
    vim.keymap.set("n", "<leader>gb",
      function() builtin.git_branches({ use_file_path = true }) end,
      { desc = "Git branches" }
    )
    vim.keymap.set("n", "<leader>gc",
      function() builtin.git_commits({ use_file_path = true }) end,
      { desc = "Git commits (repository)" }
    )
    vim.keymap.set("n", "<leader>gC",
      function() builtin.git_bcommits({ use_file_path = true }) end,
      { desc = "Git commits (current file)" }
    )
    vim.keymap.set("n", "<leader>gt",
      function() builtin.git_status({ use_file_path = true }) end,
      { desc = "Git status" }
    )
  end
}
