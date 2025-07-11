vim.keymap.set("n", "<leader><esc>", ":nohlsearch<CR>", { noremap = true })

--codecompanion start/toggle
vim.keymap.set("n", "<leader>cc", ":CodeCompanionChat Toggle<CR>", { noremap = true })
vim.keymap.set("v", "<leader>cc", ":CodeCompanion <CR>", { noremap = true })

--rsync up/down file
vim.keymap.set("n", "<leader>ru", ":RsyncUpFile <CR>", {noremap = true})
vim.keymap.set("n", "<leader>rd", ":RsyncDownFile <CR>", {noremap = true})
