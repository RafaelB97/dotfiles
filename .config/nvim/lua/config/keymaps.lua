-- Exits from instert mode to normal mode with jk
vim.keymap.set('i', 'jk', '<Esc>', {})

-- Switch buffer with tabs
vim.keymap.set("n", "<Tab>", ":bnext<CR>", {})
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", {})

-- Switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window", remap = true })

-- Resize windows
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

