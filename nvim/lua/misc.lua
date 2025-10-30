require'pounce'.setup{
accept_keys = "AEPROTKWLSKDJFMGNZXC",
accept_best_key = "<enter>",
multi_window = true,
debug = false,
}


require'toggle_lsp_diagnostics'.init({ start_on = true })
require('telekasten').setup({
      -- Main paths
      home = '/home/nery/wiki/',        -- path to main notes folder
      dailies = '/home/nery/wiki/dailies/',       -- path to daily notes
      weeklies = '/home/nery/wiki/weeklies/',      -- path to weekly notes
      templates = '/home/nery/wiki/templates/',   -- path to templates

      -- Specific note templates
        -- set to `nil` or do not specify if you do not want a template
      template_new_note = '/home/nery/wiki/templates/new_note.md',    -- template for new notes
      template_new_daily = '/home/nery/wiki/templates/new_daily.md',   -- template for new daily notes
      template_new_weekly = '/home/nery/wiki/templates/new_weekly.md',  -- template for new weekly notes

      -- Image subdir for pasting
        -- subdir name
        -- or nil if pasted images shouldn't go into a special subdir
      image_subdir = "/home/nery/wiki/img/",

      -- File extension for note files
      extension    = ".md",

      -- Generate note filenames. One of:
        -- "title" (default) - Use title if supplied, uuid otherwise
        -- "uuid" - Use uuid
        -- "uuid-title" - Prefix title by uuid
        -- "title-uuid" - Suffix title with uuid
      new_note_filename = "title",
      -- file uuid type ("rand" or input for os.date such as "%Y%m%d%H%M")
      uuid_type = "%Y%m%d%H%M",
      -- UUID separator
      uuid_sep = "-",

      -- Flags for creating non-existing notes
      follow_creates_nonexisting = true,    -- create non-existing on follow
      dailies_create_nonexisting = true,    -- create non-existing dailies
      weeklies_create_nonexisting = true,   -- create non-existing weeklies

      -- skip telescope prompt for goto_today and goto_thisweek
      journal_auto_open = false,

      -- Image link style",
        -- wiki:     ![[image name]]
        -- markdown: ![](image_subdir/xxxxx.png)
      image_link_style = "wiki",

      -- Default sort option: 'filename', 'modified'
      sort = "filename",

      -- Make syntax available to markdown buffers and telescope previewers
      install_syntax = true,

      -- Tag notation: '#tag', '@tag', ':tag:', 'yaml-bare'
      tag_notation = "#tag",

      -- When linking to a note in subdir/, create a [[subdir/title]] link
      -- instead of a [[title only]] link
      subdirs_in_links = true,

      -- Command palette theme: dropdown (window) or ivy (bottom panel)
      command_palette_theme = "ivy",

      -- Tag list theme:
        -- get_cursor (small tag list at cursor)
        -- dropdown (window)
        -- ivy (bottom panel)
      show_tags_theme = "ivy",

      -- Previewer for media files (images mostly)
        -- "telescope-media-files" if you have telescope-media-files.nvim installed
        -- "catimg-previewer" if you have catimg installed
        -- "viu-previewer" if you have viu installed
      media_previewer = "telescope-media-files",

      -- Customize insert image and preview image files list. This is useful
      -- to add optional filetypes into filtered list (for example
      -- telescope-media-files optionally supporting svg preview)
      media_extensions = {
        ".png",
        ".jpg",
        ".bmp",
        ".gif",
        ".pdf",
        ".mp4",
        ".webm",
        ".webp",
      },

      -- Calendar integration
      plug_into_calendar = true,         -- use calendar integration
      calendar_opts = {
        weeknm = 4,                      -- calendar week display mode:
                                         --   1 .. 'WK01'
                                         --   2 .. 'WK 1'
                                         --   3 .. 'KW01'
                                         --   4 .. 'KW 1'
                                         --   5 .. '1'

        calendar_monday = 1,             -- use monday as first day of week:
                                         --   1 .. true
                                         --   0 .. false

        calendar_mark = 'left-fit',      -- calendar mark placement
                                         -- where to put mark for marked days:
                                         --   'left'
                                         --   'right'
                                         --   'left-fit'
      },

      vaults = {
        default = {
          -- configuration for personal vault. E.g.:
          home = "/home/nery/wiki/",
        },
	escola = 
	{
		home = "/home/nery/wiki/escola_online/",
	},
	gastos = 
	{
		home = "/home/nery/wiki/gastos/",
	},
      },

      -- Specify a clipboard program to use
      clipboard_program = "", -- xsel, xclip, wl-paste, osascript
    }
)

require('neoscroll').setup({
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
require("oil").setup({
keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = "actions.select_vsplit",
    ["<C-h>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-p>"] = "actions.preview",
    ["q"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["<BS>"] = "actions.parent",
    ["cdw"] = "actions.open_cwd",
    ["cd"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
  },
}
)

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')


require('typeit').setup({
    default_speed = 30,    -- Default typing speed (milliseconds)
    default_pause = 'paragraph' -- Default pause behavior ('line' or 'paragraph')
})
