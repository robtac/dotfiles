--[[
Neovin init.lua
]]

-- Source vimrc
vim.cmd'source ~/.vimrc'

-- Utility functions to use from cmd
require'functions'

-- Autocmds
require'autocmd'

-- Mappings
require'mappings'

-- Settings
require'settings'

-- Plugins
require'plugins'

-- Package configuration and package specific mappings
require'config'
