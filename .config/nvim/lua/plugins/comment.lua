return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
    local comment = require("Comment.api")

    -- Comment one line in normal mode
		vim.keymap.set(
      "n",
      "<leader>/",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      { desc = "Toggle comment" }
    )

    -- Comment bock in normal mode
    local esc = vim.api.nvim_replace_termcodes(
      '<ESC>', true, false, true
    )
		vim.keymap.set(
      "x",
      "<leader>/",
      function()
        vim.api.nvim_feedkeys(esc, 'nx', false)
        comment.toggle.blockwise(vim.fn.visualmode())
      end,
      { desc = "Toggle comment" }
    )
  end,
  lazy = false,
}
