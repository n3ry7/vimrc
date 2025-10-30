
local iron = require("iron.core")
local view = require("iron.view")

local venv_python = os.getenv("VIRTUAL_ENV") and os.getenv("VIRTUAL_ENV") .. "/bin/python" or "python"

iron.setup {
  config = {
    scratch_repl = true,
    repl_definition = {
      python = {
        command = { venv_python, "-m", "IPython" },
        format = require("iron.fts.common").bracketed_paste,
      },
    },
    repl_open_cmd = view.split.vertical.botright(0.44),
  },
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<leader>w",
    send_file = "<space>sf",
    send_line = "<leader>w",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  highlight = {
    italic = true
  },
  ignore_blank_lines = true,
}

vim.keymap.set('n', '<leader>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<cr>')
