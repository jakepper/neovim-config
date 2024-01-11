-- lua/lazy_init.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
    		"git",
    		"clone",
    		"--filter=blob:none",
    		"https://github.com/folke/lazy.nvim.git",
    		"--branch=stable", -- latest stable release
    		lazypath,
 	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
--[[
	-- LSP
	{
   	'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
         -- LSP Support
         { 'neovim/nvim-lspconfig' },             -- Required
         { 'williamboman/mason.nvim' },           -- Optional
            {'williamboman/mason-lspconfig.nvim' }, -- Optional

         -- Autocompletion
         { 'L3MON4D3/LuaSnip' },     -- Required
         { 'hrsh7th/nvim-cmp' },     -- Required
         { 'hrsh7th/cmp-nvim-lsp' }, -- Required
         { 'hrsh7th/cmp-buffer' },   -- Optional
         { 'hrsh7th/cmp-path' },     -- Optional
         { 'saadparwaiz1/cmp_luasnip' },   -- Optional
         { 'rafamadriz/friendly-snippets' },   -- Optional
      },
      config = function (_, opts)
         if opts then require("luasnip").config.setup(opts) end
         vim.tbl_map(
               function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
               { "vscode", "snipmate", "lua" }
         )
         -- friendly-snippets - enable standardized comments snippets
               require("luasnip").filetype_extend("typescript", { "tsdoc" })
               require("luasnip").filetype_extend("javascript", { "jsdoc" })
               require("luasnip").filetype_extend("typescript", { "javascript" })
               require("luasnip").filetype_extend("lua", { "luadoc" })
               require("luasnip").filetype_extend("python", { "pydoc" })
               require("luasnip").filetype_extend("rust", { "rustdoc" })
               require("luasnip").filetype_extend("cs", { "csharpdoc" })
               require("luasnip").filetype_extend("java", { "javadoc" })
               require("luasnip").filetype_extend("c", { "cdoc" })
               require("luasnip").filetype_extend("cpp", { "cppdoc" })
               require("luasnip").filetype_extend("php", { "phpdoc" })
               require("luasnip").filetype_extend("kotlin", { "kdoc" })
               require("luasnip").filetype_extend("ruby", { "rdoc" })
               require("luasnip").filetype_extend("sh", { "shelldoc" })
      end
  	},
})
--]]
