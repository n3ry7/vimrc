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

local plugins = {
    -- General plugins
    {"nvim-lua/plenary.nvim"},
    {"nvim-telescope/telescope.nvim"},
    {"renerocksai/telekasten.nvim"},
    {"junegunn/fzf"},
    {"junegunn/fzf.vim"},
    {"MunifTanjim/nui.nvim"},
    {"nvim-telescope/telescope-file-browser.nvim"},
    {'stevearc/oil.nvim'},
    {"nvim-treesitter/nvim-treesitter"},
    {'nvim-treesitter/nvim-treesitter-textobjects'},
    {'simrat39/symbols-outline.nvim'},
    {"dikiaap/minimalist"},
    {"tanvirtin/monokai.nvim"},
    {"marko-cerovac/material.nvim"},
    {"tpope/vim-surround"},
    {"tpope/vim-commentary"},
    {"tpope/vim-fugitive"},
    {"pixelneo/vim-python-docstring"},
    {"wellle/targets.vim"},
    {"karb94/neoscroll.nvim"},
    {"rlane/pounce.nvim"},
    {"justinmk/vim-sneak"},
    {"ap/vim-buftabline"},
    {"nvim-tree/nvim-web-devicons"},
    {"nvim-tree/nvim-tree.lua"},
    {"romgrk/barbar.nvim"},
    {"windwp/nvim-autopairs"},
    {"lervag/wiki.vim"},
    {"ellisonleao/glow.nvim"},
    {"junegunn/goyo.vim"},
    {'Piotr1215/typeit.nvim'},

{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    }
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
      end,
    })
  end,
},

    -- LaTeX and Jupyter
    {"lervag/vimtex"},
    {"hkupty/iron.nvim"},
    {"GCBallesteros/jupytext.vim"},
	-- {
	--   "epwalsh/obsidian.nvim",
	--   version = "*",  -- recommended, use latest release instead of latest commit
	--   lazy = true,
	--   ft = "markdown",
	--   -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	--   -- event = {
	--   --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   --   "BufReadPre path/to/my-vault/**.md",
	--   --   "BufNewFile path/to/my-vault/**.md",
	--   -- },
	--   dependencies = {
	--     -- Required.
	--     "nvim-lua/plenary.nvim",

	--     -- see below for full list of optional dependencies 👇
	--   },

    -- LSP and completion
    {"neovim/nvim-lspconfig"},
    {"hrsh7th/cmp-nvim-lsp"},
    {'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'},
    {"simrat39/rust-tools.nvim"},
    {"mfussenegger/nvim-dap"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-cmdline"},
    {"hrsh7th/nvim-cmp"},
    {'jose-elias-alvarez/null-ls.nvim'},
    -- {"Exafunction/codeium.nvim"},
{
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end
},

    -- Snippets
    {"L3MON4D3/LuaSnip"},
    {"saadparwaiz1/cmp_luasnip"},
    {"rafamadriz/friendly-snippets"},


}
local opts = {
    -- workspaces = {
    --   {
    --     name = "Anatel",
    --     path = "~/wiki/Anatel/",
    --   },
  -- },
}

require("lazy").setup(plugins, opts)
