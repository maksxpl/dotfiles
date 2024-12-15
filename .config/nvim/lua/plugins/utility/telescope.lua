-- https://github.com/nvim-telescope/telescope.nvim
-- fuzzy finder
return {
  { -- telescope
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {}
      require('telescope').load_extension('media_files')
    end
  },
  {
    'nvim-telescope/telescope-media-files.nvim',
    requires = { 'nvim-telescope/telescope.nvim' },
  },
  { -- ui select
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
  { -- recent files
    "smartpde/telescope-recent-files"
  },
}

