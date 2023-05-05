local plugins = {
  "folke/which-key.nvim",         -- tooltip popup menu

  -- colorschemes
  "folke/tokyonight.nvim", 

  -- cmp plugins
  "hrsh7th/nvim-cmp",             -- The completion plugin
  "hrsh7th/cmp-buffer",           -- buffer completions
  "hrsh7th/cmp-path",             -- path completions
  "hrsh7th/cmp-cmdline",          -- cmdline completions
  "saadparwaiz1/cmp_luasnip",     -- snippet completions

  -- snippets
  "L3MON4D3/LuaSnip",             -- snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use
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
