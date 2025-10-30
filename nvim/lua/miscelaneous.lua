require'pounce'.setup{
accept_keys = "AEPROTKWLSKDJFMGNZXC",
accept_best_key = "<enter>",
multi_window = true,
debug = false,
}

require'toggle_lsp_diagnostics'.init({ start_on = false }})

-- require('neoscroll').setup({
-- -- All these keys will be mapped to their corresponding default scrolling animation
-- mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
-- '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
-- hide_cursor = true,          -- Hide cursor while scrolling
-- stop_eof = true,             -- Stop at <EOF> when scrolling downwards
-- respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
-- cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
-- easing_function = nil,       -- Default easing function
-- pre_hook = nil,              -- Function to run before the scrolling animation starts
-- post_hook = nil,             -- Function to run after the scrolling animation ends
-- performance_mode = false,    -- Disable "Performance Mode" on all buffers.
-- })

require('neoscroll').setup({
-- All these keys will be mapped to their corresponding default scrolling animation
mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
'<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
hide_cursor = true,          -- Hide cursor while scrolling
stop_eof = true,             -- Stop at <EOF> when scrolling downwards
respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
easing_function = nil,       -- Default easing function
pre_hook = nil,              -- Function to run before the scrolling animation starts
post_hook = nil,             -- Function to run after the scrolling animation ends
performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-a>'] = {'scroll', {'-vim.wo.scroll', 'true', '200'}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '200'}}
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
t['<C-u>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}


require("nvim-autopairs").setup {}

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')
npairs.add_rules({
Rule("*", "*"),
Rule("**", "*"),
}
)

