-- Exits from instert mode to normal mode with jk
vim.keymap.set('i', 'jk', '<Esc>', {})

-- Switch buffer with tabs
vim.keymap.set("n", "<Tab>", ":bnext<CR>", {})
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", {})

-- Quit window
vim.keymap.set("n", "<space>q", "<CMD>confirm q<CR>", { desc = "Close window" })
vim.keymap.set("n", "<space>Q", "<CMD>confirm qa<CR>", { desc = "Close all windows" })

-- Comments
vim.keympa.set({"n", "x"}, "<space>/", "gcc", { desc = "Comment line" })
