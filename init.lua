-- TODO Autoformat .go files when write a buffer
-- TODO highlight witespace: /\s\+$/, highlight: /\t, :%s/ \+$//g<cr>
vim.opt.path:append "**"
vim.opt.clipboard = "unnamedplus"
vim.opt.wildmenu = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.swapfile = false

vim.opt.termguicolors = true
vim.opt.syntax = "enable"
vim.opt.syntax = "on"
vim.opt.cursorline = true
vim.cmd "colorscheme OceanicNext"
--vim.cmd "colorscheme slate"
--vim.cmd "highlight Comment guifg=#AAAAAA"
--vim.cmd "highlight Pmenu guibg=#444400"

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3

local keymap_option = { noremap = true, silent = true }

-- Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", keymap_option)
vim.g.mapleader = " "
vim.g.localleader = " "

-- Press jk to exit insert mode
vim.api.nvim_set_keymap("i", "jk", "<ESC>", keymap_option)
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", keymap_option)

-- vim.api.nvim_set_keymap("v", "'", "", keymap_option)

-- Show whitespaces
vim.opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
-- vim.api.nvim_set_keymap("n", "<leader>wh", ":set list!<CR>", keymap_option)
-- vim.api.nvim_create_autocmd("BufWritePre", { callback = -- TODO augroup, ask for delete or just highlight
-- function()
--   pcall(vim.cmd, ":%s/ \\+$//g")
-- end })

-- Plugins
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/semmi/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "williamboman/mason.nvim"
  use "neovim/nvim-lspconfig"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "mhartington/oceanic-next"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  use "hrsh7th/cmp-nvim-lua"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end
)

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "cmake", "bash", "go", "dockerfile", "python", "lua", "make" },
  highlight = {
    enable = true
  }
}

-- mason config
local ok, mason = pcall(require, "mason")
if not ok then
  vim.notify("mason not found\nInstall williamboman/mason.nvim\n")
else
  mason.setup()
end

require "custom.lsp"
require "custom.cmp"
