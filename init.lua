vim.opt.path:append "**"
vim.opt.clipboard:append "unnamedplus"
vim.opt.clipboard:append "unnamed"
vim.opt.wildmenu = true
-- vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.cmd("colorscheme lunaperche")

vim.opt.termguicolors = true
vim.opt.syntax = "enable"
vim.opt.syntax = "on"
vim.opt.cursorline = true

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

vim.api.nvim_set_keymap("i", "jk", "<ESC>", keymap_option)
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", keymap_option)
vim.api.nvim_set_keymap("n", "<leader>v", ":Vifm<cr>", keymap_option)

-- Whitespaces
vim.opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣" -- type ":set list" to show whitespaces
vim.api.nvim_create_augroup("ShowTrailingWhiteSpaces", {clear = true})
vim.api.nvim_create_autocmd({"BufWinEnter", "InsertLeave"}, {command = "match Error /\\s\\+$/", group = "ShowTrailingWhiteSpaces"})
--vim.api.nvim_create_autocmd(
--  {
--    "BufWinEnter",
--    "InsertLeave"
--  },
--  {
--    callback = function ()
--      if vim.api.nvim_get_option_value("modifiable", {}) then
--        vim.cmd("match Error /\\s\\+$/")
--      end
--    end,
--    group = "ShowTrailingWhiteSpaces"
--  }
--)
vim.api.nvim_create_autocmd({"InsertEnter", "TermEnter"}, {command = "match", group = "ShowTrailingWhiteSpaces"})

-- Disable arrow keys
vim.api.nvim_set_keymap("","<Up>", "<Nop>", keymap_option)
vim.api.nvim_set_keymap("","<Down>", "<Nop>", keymap_option)
vim.api.nvim_set_keymap("","<Left>", "<Nop>", keymap_option)
vim.api.nvim_set_keymap("","<Right>", "<Nop>", keymap_option)

function Proba()
  local line = vim.api.nvim_get_current_line()
  if line == "" then
    return
  end
  local prefix = string.match(line, "^%s*(..)")
  if prefix == "--" then
    vim.cmd("normal! ^xx")
  else
    vim.cmd("normal! I--")
  end
end

-- Plugins
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use {
      'numToStr/Comment.nvim',  -- Toggle comment: gcc
      config = function()
          require('Comment').setup()
      end
  }

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
  ensure_installed = { "c", "cpp", "cmake", "bash", "go", "dockerfile", "python", "lua", "make"},
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
