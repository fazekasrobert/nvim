vim.opt.path:append "**"
vim.opt.clipboard:append "unnamedplus"
vim.opt.clipboard:append "unnamed"
vim.opt.wildmenu = true
-- vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.cmd("colorscheme gruvbox")
vim.cmd("let g:gruvbox_contrast_dark = 'hard'")

vim.opt.termguicolors = true
vim.opt.syntax = "enable"
vim.opt.cursorline = true

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Whitespaces
vim.opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣" -- type ":set list" to show whitespaces
vim.api.nvim_create_augroup("ShowTrailingWhiteSpaces", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinEnter", "InsertLeave" },
  { command = "match Error /\\s\\+$/", group = "ShowTrailingWhiteSpaces" })
vim.api.nvim_create_autocmd({ "InsertEnter", "TermEnter" }, { command = "match", group = "ShowTrailingWhiteSpaces" })
