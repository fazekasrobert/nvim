-- lsp config
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  vim.notify("lspconfig not found\nInstall neovim/nvim-lspconfig\n")
  return
end

-- sumneko_lua config
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  }
}

-- gopls config
lspconfig.gopls.setup {}

-- clangd config
lspconfig.clangd.setup {}

-- cmake-language-server config
lspconfig.cmake.setup {}

-- pyright config
lspconfig.pyright.setup {}
