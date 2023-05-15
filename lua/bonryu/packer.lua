-- This file can be loaded by calling `lua require('packer')` from your init.vim

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


-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on firt use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
-- return require('packer').startup(function(use)
return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

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
            { 'hrsh7th/cmp-cmdline' }, -- Optional
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

    -- Colorschemes
    use({
        'rose-pine/neovim',
        -- as = 'rose-pine',
        -- config = function()
        --     vim.cmd('colorscheme rose-pine')
        --     -- vim.cmd[[ highlight SignColumn guibg=gray ]]
        -- end
    })
    use "lunarvim/colorschemes"
    use "folke/tokyonight.nvim"

    -- More Plugins
    use { 'feline-nvim/feline.nvim' } -- status line
    use('tpope/vim-surround') -- in (...) do `cs([` to replace () with []

    use "nvim-tree/nvim-web-devicons"
    use "nvim-tree/nvim-tree.lua"
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    use "moll/vim-bbye"
    use { "akinsho/toggleterm.nvim" }
    use { "lewis6991/gitsigns.nvim",
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use "simrat39/symbols-outline.nvim"
    use {
        'numToStr/Navigator.nvim',
        config = function()
            require('Navigator').setup()
        end
    }
    use "aserowy/tmux.nvim"
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }
end)
