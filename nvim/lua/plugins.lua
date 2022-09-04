require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    },
}

require'navigator'.setup()

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- UI
    use 'preservim/nerdtree'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- Startup Screen
    use {
      "startup-nvim/startup.nvim",
      requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
      config = function()
        require"startup".setup()
      end
    }

    -- Better syntax highlightning
    use 'nvim-treesitter/nvim-treesitter'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use({
        'ray-x/navigator.lua',
        requires = {
            { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
            { 'neovim/nvim-lspconfig' },
        },
    })
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Debugger
    use 'puremourning/vimspector'
  
    -- Colorschemes
    use 'RRethy/nvim-base16'
    use 'ray-x/aurora'

end)
