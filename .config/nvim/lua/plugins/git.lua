return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']g',
          function()
            if vim.wo.diff then return ']g' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end,
          {expr=true, desc="Next hunk"}
        )

        map('n', '[g',
          function()
            if vim.wo.diff then return '[g' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end,
          {expr=true, desc="Previous hunk"}
        )

        -- Actions
        map('n', '<leader>gl', gs.blame_line, { desc = "View Git blame"})
        map('n', '<leader>gL', function() gs.blame_line({full=true}) end, {desc = "View full Git blame"})
        map('n', '<leader>gp', gs.preview_hunk, { desc = "Preview Git hunk"})
        map('n', '<leader>gh', gs.reset_hunk, { desc = "Reset Git hunk"})
        map('n', '<leader>gr', gs.reset_buffer, { desc = "Reset git buffer"})
        map('n', '<leader>gs', gs.stage_hunk, { desc = "Stage git hunk"})
        map('n', '<leader>gS', gs.stage_buffer, { desc = "Stage git buffer"})
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = "Unstage Git hunk"})
        map('n', '<leader>gd', gs.diffthis, { desc = "View Git diff"})
      end
    })
  end
}
