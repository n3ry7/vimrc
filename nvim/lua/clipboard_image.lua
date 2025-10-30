local vim = vim

local function paste_image()
  -- Check for Markdown file
  local filetype = vim.bo.filetype
  if filetype ~= "markdown" then
    return
  end

  -- Get image path (replace with actual clipboard retrieval if needed)
  local image_path = "/home/nery/Pictures/tmp.png"

  -- Generate new image name
  local filename = vim.fn.expand("%:p:h:t") .. "_image" .. os.time() .. ".png"
  local target_path = vim.fn.expand("%:p:h") .. "/img/" .. filename

  -- Copy image to target directory
  vim.fn.mkdir(vim.fn.expand("%:p:h") .. "/img/", "p")
  vim.fn.system({ "cp", image_path, target_path })

  -- Insert Markdown link
  vim.api.nvim_put({ "![](img/" .. filename .. ")\n", type = "c" })
end

-- Hook <leader>p key press
vim.api.nvim_set_keymap("n", "<leader>pi", ":lua paste_image()<CR>", { noremap = true, silent = true })
