-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
-- Generate Defaults File (run from .config/lvim):
-- lvim --headless +'lua require("lvim.utils").generate_settings()' +qa && sort -o lv-settings.lua{,}

lvim.plugins = {
  -- When adding config = {} it calls the usual require('foo').setup{}
  {"folke/todo-comments.nvim", config ={} },
}

vim.diagnostic.config({
  virtual_text = false
})

-- DAP configuration
local dap = require('dap')
dap.adapters.godot = {
  type = "server",
  host = '127.0.0.1',
  port = 6006,
}

dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  }
}


-- LSP Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>sT', ':TodoQuickFix<CR>', opts)
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.opt.expandtab = false

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  local _notify = client.notify

  client.notify = function (method, params)
    if method == 'textDocument/didClose' then
      -- Godot doesn't implement didClose yet
      return
    end
    _notify(method, params)
  end
end

-- LSP Config for Godot
require'lspconfig'.gdscript.setup{
  on_attach = on_attach,
  filetypes = { "gd", "gdscript", "gdscript3" },
}
