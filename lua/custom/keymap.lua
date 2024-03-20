local keymap_option = { noremap = true, silent = true }

-- Disable arrow keys
vim.keymap.set("", "<Up>", "<Nop>", keymap_option)
vim.keymap.set("", "<Down>", "<Nop>", keymap_option)
vim.keymap.set("", "<Left>", "<Nop>", keymap_option)
vim.keymap.set("", "<Right>", "<Nop>", keymap_option)

-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", keymap_option)
vim.g.mapleader = " "
vim.g.localleader = " "

vim.keymap.set("i", "jk", "<ESC>", keymap_option)
vim.keymap.set("t", "jk", "<C-\\><C-n>", keymap_option)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, keymap_option)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, keymap_option)
vim.keymap.set("n", "<leader>fb", builtin.buffers, keymap_option)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, keymap_option)
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, keymap_option)

vim.keymap.set("n", "<leader><leader>", ":Telescope file_browser<CR><ESC>", keymap_option)
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", keymap_option)

local list_workspace_folders = function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

local format = function()
  vim.lsp.buf.format { async = true }
end

vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_option)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_option)
vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_option)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_option)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, keymap_option)
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, keymap_option)
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, keymap_option)
vim.keymap.set("n", "<leader>wl", list_workspace_folders, keymap_option)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, keymap_option)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymap_option)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, keymap_option)
vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_option)
vim.keymap.set("n", "gl", vim.diagnostic.open_float, keymap_option)
vim.keymap.set("n", "<leader>fo", format, keymap_option)
