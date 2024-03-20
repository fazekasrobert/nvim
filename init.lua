local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "neovim/nvim-lspconfig"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "numToStr/Comment.nvim"
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  use "morhetz/gruvbox"
  use "ggandor/leap.nvim"
  use "akinsho/toggleterm.nvim"

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }

  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  use "hrsh7th/cmp-nvim-lua"

  if packer_bootstrap then
    require("packer").sync()
  end
end
)

require "nvim-treesitter.configs".setup {
  ensure_installed = { "c", "cpp", "cmake", "bash", "go", "dockerfile", "python", "lua", "make" },
  highlight = {
    enable = true
  }
}

require "lualine".setup()
require "Comment".setup()
require "telescope".load_extension "file_browser"
require "leap".create_default_mappings()
require "toggleterm".setup()

require "custom.lsp"
require "custom.option"
require "custom.cmp"
require "custom.keymap"
-- require "custom.comment"
