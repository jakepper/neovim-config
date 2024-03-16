-- plugins/tree.lua

return {
   "nvim-tree/nvim-tree.lua",

   lazy = false,

   dependencies = {
      "nvim-tree/nvim-web-devicons"
   },

   config = function()
      local tree = require("nvim-tree")

      vim.g.loaded = 1
      vim.g.loaded_netrwPlugin = 1

      vim.cmd([[ highlight NvimTreeIndentMarker guifg=#f6c177 ]])

      tree.setup({
         renderer = {
            icons = {
                  glyphs = {
                     folder = {
                        arrow_closed = "",
                        arrow_open = "",
                     },
                  },
            },
         },
         actions = {
            open_file = {
                  quit_on_open = true,
                  window_picker = {
                     enable = false,
                  },
            },
         },
      })

      vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>")
   end
}
