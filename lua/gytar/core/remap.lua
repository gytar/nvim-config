
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "v", "n" }, "<leader>y", "\"+y")

-- center when using C-d or u jumping
vim.keymap.set({"v", "n"}, "<C-d>", "<C-d>zz")
vim.keymap.set({"v", "n"}, "<C-u>", "<C-u>zz")

-- centering when N or n in search
vim.keymap.set({"n"}, "n", "nzzzv")
vim.keymap.set({"n"}, "N", "Nzzzv")

-- adds sudo to nvim
vim.keymap.set("c", "w!!", require("gytar.utils").sudo_write, { silent = true })
