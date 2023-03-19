-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
-- Automaticall install packer
-- print(fn.stdpath "data") outputs /home/bonryu/.local/share/nvim/
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print(install_path)
    print "Installing packer close and reopen Neovim ..."
    -- Only required if you have packer configured as `opt`
    vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on firt use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]]

-- Install your plugins here
-- return require('packer').startup(function(use)
return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- Colorschemes
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Essentials
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    -- LSP related/supplemental plugins
    use({
        "jose-elias-alvarez/null-ls.nvim",
        -- config = function()
        --     require("null-ls").setup()
        -- end,
        requires = { "nvim-lua/plenary.nvim" },
    })
    use {
        'HallerPatrick/py_lsp.nvim',
        -- Support for versioning
        -- tag = "v0.0.1"
    }

    -- More Plugins
    use {'feline-nvim/feline.nvim'}
    use('tpope/vim-surround')
end)
