-- init_screen.lua

-- Define the art screen content
local art_screen = [[










              ███╗   ██╗███████╗██████╗ ██╗   ██╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
              ████╗  ██║██╔════╝██╔══██╗╚██╗ ██╔╝    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
              ██╔██╗ ██║█████╗  ██████╔╝ ╚████╔╝     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
              ██║╚██╗██║██╔══╝  ██╔══██╗  ╚██╔╝      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
              ██║ ╚████║███████╗██║  ██║   ██║       ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
              ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝   ╚═╝       ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝












]]

-- Function to create the art screen
function create_art_screen()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(art_screen, "\n"))
  vim.api.nvim_buf_set_option(buf, "number", false)
  vim.api.nvim_buf_set_option(buf, "relativenumber", false)
  vim.api.nvim_set_current_buf(buf)
end

-- Hook into the VimEnter event to create the art screen
vim.api.nvim_create_autocmd("VimEnter", {
  callback = create_art_screen
})

-- Close the art screen buffer when another buffer is opened
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.api.nvim_buf_is_valid(vim.api.nvim_get_current_buf()) and vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) ~= "" then
      vim.api.nvim_buf_delete(vim.api.nvim_get_current_buf(), { force = true })
    end
  end
})
