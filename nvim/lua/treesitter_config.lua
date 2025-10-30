-- Disable netrw at the very start (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Treesitter Configuration
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
    "python", 
    "lua", 
    "rust", 
  },
  
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  
  -- List of parsers to ignore installing
  ignore_install = { },
  
  -- Treesitter Text Objects
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- Function text objects
        ["af"] = "@function.outer",  -- Select around function (more concise syntax)
        ["if"] = "@function.inner",  -- Select inside function
        
        -- Class text objects
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
      selection_modes = {
        ['@function.outer'] = 'V',    -- linewise selection for functions
        ['@class.outer'] = '<c-v>',   -- blockwise selection for classes
      },
      include_surrounding_whitespace = false,
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["f"] = "@function.outer",   -- Jump to next function start
      },
      goto_previous_start = {
        ["F"] = "@function.outer",   -- Jump to previous function start
      },
    },
  },
  
  -- Highlighting configuration
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}

-- Optional: Additional Treesitter Text Objects Plugin Configuration
require'nvim-treesitter.configs'.setup {
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",  -- Swap parameters
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",  -- Peek function definition
        ["<leader>dF"] = "@class.outer",     -- Peek class definition
      },
    },
  },
}
