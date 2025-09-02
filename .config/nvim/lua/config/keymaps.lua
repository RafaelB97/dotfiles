-- Exits from instert mode to normal mode with jk
vim.keymap.set('i', 'jk', '<Esc>', {})

-- Switch buffer with tabs
vim.keymap.set("n", "<Tab>", ":bnext<CR>", {})
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", {})

-- Close buffer
vim.keymap.set("n", "<space>c", ":bd<CR>", { desc = "Close buffer" })
