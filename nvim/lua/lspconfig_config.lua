local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').jedi_language_server.setup {
  capabilities = capabilities, 
}

require('lspconfig').marksman.setup {
  capabilities = capabilities,
}

require('lspconfig').terraformls.setup {
	capabilities = capabilities
}

require('lspconfig').gdscript.setup {
	capabilities = capabilities
}

require('lspconfig').clangd.setup({
  on_attach = function(client, bufnr)
    vim.fn_call('nvim_buf_set_option', bufnr, 'undolevels', -1)
  end,
  capabilities = {
    document_formatting = true,
    completion = {
      completion_trigger_kind = {
        document_symbol = true,
      },
    },
    hover = true,
    implementation = true,  -- Enable implementation for clangd, for example
  },
})

require('lspconfig').efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"python"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = {
                {formatCommand = "black --quiet -", formatStdin = true},
                {
                    lintCommand = "flake8 --stdin-display-name ${INPUT} -",
                    lintStdin = true,
                    lintFormats = {"%f:%l:%c: %m"}
                }
            }
        }
    }
}

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

vim.lsp.set_log_level("debug")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- ... existing mappings ...

    -- Add signature help keybinding
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = ev.buf })
  end,
})

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})


-- Map the toggle command to <leader>gt
vim.api.nvim_set_keymap('n', '<leader>gt', '<cmd>lua toggle_lint_diagnosis()<CR>', { noremap = true, silent = true })

-- In your init.lua
require('null-ls').setup({
    sources = {
        require('null-ls').builtins.formatting.black,
    }
})

-- Add a keymapping to format
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, {})
