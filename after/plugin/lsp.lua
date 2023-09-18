-- lsp.lua



local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "lua_ls",
    "omnisharp",
    "cssls",
    "html",
    "jsonls",
    "tsserver",
    "marksman",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-h>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-y>"] = cmp.mapping.complete(),
})

local luasnip = require "luasnip"
luasnip.filetype_extend("typescript", { "tsdoc" })
luasnip.filetype_extend("javascript", { "jsdoc" })
luasnip.filetype_extend("lua", { "luadoc" })
luasnip.filetype_extend("python", { "pydoc" })
luasnip.filetype_extend("rust", { "rustdoc" })
luasnip.filetype_extend("cs", { "csharpdoc" })
luasnip.filetype_extend("java", { "javadoc" })
luasnip.filetype_extend("c", { "cdoc" })
luasnip.filetype_extend("cpp", { "cppdoc" })
luasnip.filetype_extend("php", { "phpdoc" })
luasnip.filetype_extend("kotlin", { "kdoc" })
luasnip.filetype_extend("ruby", { "rdoc" })
luasnip.filetype_extend("sh", { "shelldoc" })
luasnip.filetype_extend("javascriptreact", { "javascript" })
luasnip.filetype_extend("typescriptreact", { "typescript" })
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'buffer'},
        {name = 'path'},
    },
    mapping = cmp_mappings,
})

vim.diagnostic.config({
    virtual_text = true
})
