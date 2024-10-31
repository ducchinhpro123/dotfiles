-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = '*',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   config = function()
  --     require('bufferline').setup {
  --       options = {
  --         mode = 'buffers', -- set to "tabs" to only show tabpages instead
  --         numbers = 'none', -- can be "none" | "ordinal" | "buffer_id" | "both"
  --         close_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
  --         right_mouse_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
  --         left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
  --         middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
  --         indicator = {
  --           icon = '▎', -- this should be omitted if indicator style is not 'icon'
  --           style = 'icon', -- can be 'icon' | 'underline' | 'none',
  --         },
  --         buffer_close_icon = '󰅖',
  --         modified_icon = '●',
  --         close_icon = '',
  --         left_trunc_marker = '',
  --         right_trunc_marker = '',
  --         max_name_length = 18,
  --         max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
  --         truncate_names = true, -- whether or not tab names should be truncated
  --         tab_size = 18,
  --         diagnostics = 'nvim_lsp',
  --         diagnostics_update_in_insert = false,
  --         offsets = {
  --           {
  --             filetype = 'NvimTree',
  --             text = 'File Explorer',
  --             text_align = 'left',
  --             separator = true,
  --           },
  --         },
  --         color_icons = true, -- whether or not to add the filetype icon highlights
  --         show_buffer_icons = true, -- disable filetype icons for buffers
  --         show_buffer_close_icons = true,
  --         show_close_icon = true,
  --         show_tab_indicators = true,
  --         persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
  --         separator_style = 'thin', -- can be "slant" | "thick" | "thin" | { 'any', 'any' },
  --         enforce_regular_tabs = false,
  --         always_show_bufferline = true,
  --         hover = {
  --           enabled = true,
  --           delay = 200,
  --           reveal = { 'close' },
  --         },
  --       },
  --     }
  --
  --     -- Keymappings for buffer navigation
  --     vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
  --     vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
  --   end,
  -- },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        -- Copilot options
      }
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
    },
    build = 'make tiktoken',
    config = function()
      require('CopilotChat').setup {
        debug = true,
        -- Other options
      }
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        '*',
      }
    end,
  },
  -- {
  --   'lervag/vimtex',
  --   lazy = false, -- we don't want to lazy load VimTeX
  --   -- tag = "v2.15", -- uncomment to pin to a specific release
  --   init = function()
  --     -- VimTeX configuration goes here, e.g.
  --     vim.g.vimtex_view_method = 'zathura'
  --   end,
  -- },
  {
    'yuezk/vim-js',
  },
  {
    'maxmellon/vim-jsx-pretty',
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   opts = {
  --     options = {
  --       -- Set a different theme (you can change this to any lualine-supported theme)
  --       theme = 'gruvbox', -- You can also try 'nord', 'dracula', etc.
  --       component_separators = { left = '', right = '' },
  --       section_separators = { left = '', right = '' },
  --       icons_enabled = true, -- Enable icons if using 'nvim-web-devicons'
  --     },
  --     sections = {
  --       -- These are the sections on the left and right of the status line
  --       lualine_a = {
  --         {
  --           'mode',
  --           fmt = function(mode)
  --             return mode:sub(1, 1)
  --           end,
  --         }, -- Display only the first character of the mode
  --       },
  --       lualine_b = { 'branch', 'diff', 'diagnostics' },
  --       lualine_c = {
  --         { 'filename', path = 1 }, -- Shows full file path
  --       },
  --       lualine_x = { 'encoding', 'fileformat', 'filetype' },
  --       lualine_y = { 'progress' },
  --       lualine_z = { 'location' },
  --     },
  --     inactive_sections = {
  --       -- This is the configuration for inactive windows
  --       lualine_a = {},
  --       lualine_b = {},
  --       lualine_c = { 'filename' },
  --       lualine_x = { 'location' },
  --       lualine_y = {},
  --       lualine_z = {},
  --     },
  --     extensions = { 'fugitive', 'nvim-tree', 'quickfix' }, -- Load extensions to customize for specific buffers
  --   },
  -- },
}
