-- Exits from instert mode to normal mode with jk
vim.keymap.set('i', 'jk', '<Esc>', {})

-- Switch buffer with tabs
vim.keymap.set("n", "<Tab>", ":bnext<CR>", {})
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", {})

-- Quit window
vim.keymap.set("n", "<space>q", "<CMD>confirm q<CR>", { desc = "Close window" })
vim.keymap.set("n", "<space>Q", "<CMD>confirm qa<CR>", { desc = "Close all windows" })

-- Comments
vim.keymap.set("n", "<space>/", ":normal gcc<CR><DOWN>", { desc = "Comment line" })
-- <Esc> - exists visual mode.
-- :normal executes keystrokes in normal mode.
-- gv - restores selection.
-- gc - toggles comment
-- <CR> sends the command
vim.keymap.set('x', '<space>/', '<Esc>:normal gvgc<CR>', { desc = '[/] Toggle comment block' })

-- New tab with current buffer
vim.keymap.set("n", "<space>wt", "<CMD>tabe %<CR>", { desc =  "Open buffer in new tab"})
