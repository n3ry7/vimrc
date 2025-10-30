local fb_actions = require "telescope".extensions.file_browser.actions
local actions = require('telescope.actions')
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-d>"] = fb_actions.change_cwd
          -- your custom insert mode mappings
        },
        ["n"] = {
          ["<C-c>"] = function(prompt_bufnr)
              -- your custom function logic here
            end
        },
      },
    },
  },
}

require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  "<cmd>lua require 'telescope'.extensions.file_browser.file_browser({files=false}, {depth=false})<CR>",
  { noremap = true }
)

vim.keymap.set('n', '<leader>f', function()
    require('telescope.builtin').treesitter({
        bufnr = 0,  -- current buffer only
        symbols = {'function'}  -- filter to show only functions
    })
end, { desc = 'List functions in current buffer' })

vim.keymap.set('n', '<leader>c', function()
    require('telescope.builtin').treesitter({
        bufnr = 0,  -- current buffer only
        symbols = {'type'}  -- filter to show only functions
    })
end, { desc = 'List functions in current buffer' })


vim.g.nvim_tree_root_folder_modifier = ':~'
