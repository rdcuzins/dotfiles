local plugins = {
  "folke/which-key.nvim",         -- tooltip popup menu
  "nvim-lua/popup.nvim",          -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim",        -- Useful lua functions used by lots of plugins

  -- colorschemes
  "folke/tokyonight.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp",             -- The completion plugin
  "hrsh7th/cmp-buffer",           -- buffer completions
  "hrsh7th/cmp-path",             -- path completions
  "hrsh7th/cmp-cmdline",          -- cmdline completions
  "saadparwaiz1/cmp_luasnip",     -- snippet completions
  "hrsh7th/cmp-nvim-lsp",         -- lsp completion
  "hrsh7th/cmp-nvim-lua",         -- lua completion

  -- snippets
  "L3MON4D3/LuaSnip",             -- snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- lsp
  "neovim/nvim-lspconfig",        --enable LSP
  "williamboman/mason.nvim",      -- lsp manager
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",

  -- Telescope
  "nvim-telescope/telescope.nvim",

  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
}

-- Install lazy installer if doesnt exist
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

require("lazy").setup(plugins)
