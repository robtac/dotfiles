-- Don't repeat line comments
vim.api.nvim_exec([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]], false)
-- Yank Highlight
vim.api.nvim_exec([[
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{on_visual = false}
]], false)
-- Install New Packages Automatically
vim.api.nvim_exec([[
  autocmd BufWritePost plugins.lua PackerCompile
]], false)
