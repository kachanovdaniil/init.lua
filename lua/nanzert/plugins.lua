local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"

    use "folke/which-key.nvim"
    use "nvim-lua/plenary.nvim"

    use "windwp/nvim-autopairs"

    use "folke/neodev.nvim"
    
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
    use 'mfussenegger/nvim-dap'
    -- maybe later
    -- use { "glacambre/firenvim", run = function()
    --     vim.fn["firenvim#install"](0)
    -- end }

    -- Colorschemes
    use { "ellisonleao/gruvbox.nvim" }

    -- Cmp
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "saadparwaiz1/cmp_luasnip"
    use "mfussenegger/nvim-dap-python" 
    -- Snippets
    use "L3MON4D3/LuaSnip"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "nvimtools/none-ls.nvim"
    use "RRethy/vim-illuminate"

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Comment
    use "numToStr/Comment.nvim"

    -- Treesitter
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/nvim-treesitter-context"

    -- Rust
    use "mrcjkb/rustaceanvim"

    -- Harpoon
    use "ThePrimeagen/harpoon"

    -- Copilot
    use "zbirenbaum/copilot.lua"
    use "zbirenbaum/copilot-cmp"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
