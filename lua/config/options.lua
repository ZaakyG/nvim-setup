vim.opt.number = true
vim.optrelativenumber = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300

vim.cmd("colorscheme tokyonight")
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.opt.tabstop = 4        -- how many spaces a tab counts for
vim.opt.shiftwidth = 4     -- size of autoindent
vim.opt.expandtab = true   -- use spaces instead of tabs
vim.opt.softtabstop = 4    -- spaces inserted when pressing Tab

vim.opt.signcolumn = "yes:1"

-- To reduce flickering
vim.diagnostic.config({
  --virtual_text = true,   -- inline errors
  signs = true,
  underline = true,
  update_in_insert = false, -- don't flicker while typing
})
