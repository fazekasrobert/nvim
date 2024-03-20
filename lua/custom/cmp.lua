local ok, cmp, luasnip

ok, cmp = pcall(require, "cmp")
if not ok then
  vim.notify("cmp not found\nInstall hrsh7th/nvim-cmp\n")
  return
end

ok, luasnip = pcall(require, "luasnip")
if not ok then
  vim.notify("luasnip not found\nInstall L3MON4D3/LuaSnip\n")
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = cmp.config.sources({
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" }
  }),
  mapping = cmp.mapping.preset.insert({
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
})
