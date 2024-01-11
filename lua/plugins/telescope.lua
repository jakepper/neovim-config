-- plugins/telescope.lua

return {      
   "nvim-telescope/telescope.nvim",

   tag = "0.1.5",

   dependencies = {
      "plenary"
   },

   config = function()
      require('telescope').setup({})
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>ps', function()
         builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
   end
}