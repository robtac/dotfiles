-- Install packer if not already installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

-- Any configuration that is pre-loading goes here
vim.g.kommentary_create_default_mappings = false

return require('packer').startup(function(use)
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'},
                    {'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Autocomplete
    use 'nvim-lua/completion-nvim'

    -- Language specific
    use 'lervag/vimtex'

    -- Async
    use 'tpope/vim-dispatch'

    -- Typing/Editing
    use 'b3nj5m1n/kommentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'

    -- Git
    use 'tpope/vim-fugitive'

    -- Nerdtree
    use 'scrooloose/nerdtree'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    
    -- Statusline
    use 'vim-airline/vim-airline'

    -- Color theme
    use 'arcticicestudio/nord-vim'
    use 'drewtempelmeyer/palenight.vim'

    -- Sudo perms
    use 'lambdalisue/suda.vim'
end)
