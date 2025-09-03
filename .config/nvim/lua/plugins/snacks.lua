return {
"folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    bufdelete = {enabled = true },
    dashboard = { enabled = true },
    explorer = { 
      enabled = true,
      replace_netrw = true,
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
  keys = {
    -- TODO: Projects

    -- Explorer
    { "<leader>e", 
      function() 
        Snacks.explorer({
          auto_close = true,
          hidden = true
        })
      end,
      desc = "Explorer"
    },

    -- Pickers
    { "<leader><space>", function() Snacks.picker.smart({ hidden = true }) end, desc = "Find files" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Find recent files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fT", function() Snacks.picker.todo_comments() end, desc = "Todo" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },

    -- Grep
    { "<leader>fl", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>fc", function() Snacks.picker.grep_word() end, desc = "Find visual selection or word", mode = { "n", "x" } },
    { "<leader>fw", function() Snacks.picker.grep({ hidden = true }) end, desc = "Find words (grep)" },

    -- Git
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },

    -- Close buffer
    { "<leader>c",
      function ()
        Snacks.bufdelete()
      end,
      desc = "Close buffer"
    }
  }
}
