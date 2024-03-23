local plugins = {
  { "neovim/nvim-lspconfig" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "numToStr/Comment.nvim",
    lazy = false
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    cdm = "Telescope file_browser",
    dependencies = { { "nvim-telescope/telescope.nvim", lazy = true }, { "nvim-lua/plenary.nvim", lazy = true } }
  },
  { "morhetz/gruvbox" },
  { "ggandor/leap.nvim" },
  { "akinsho/toggleterm.nvim" },
  {
    'akinsho/bufferline.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true }
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true }
  },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "hrsh7th/cmp-nvim-lua" },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)

require "nvim-treesitter.configs".setup {
  -- ensure_installed = { "c", "cpp", "cmake", "bash", "go", "dockerfile", "python", "lua", "make" },
  sync_install = false,
  highlight = {
    enable = true
  }
}

require "lualine".setup()
require "Comment".setup()
require "telescope".load_extension "file_browser"
require "leap".create_default_mappings()
require "toggleterm".setup()
require("bufferline").setup()

require "custom.lsp"
require "custom.option"
require "custom.cmp"
require "custom.keymap"
-- require "custom.comment"
