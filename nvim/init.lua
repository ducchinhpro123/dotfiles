-- Load core settings
require('core.options')
require('core.keymaps')
require('core.autocmds')

require'nvim-tree'.setup {}


-- Load plugins
require('plugins.init')


-- require'lspconfig'.rust_analyzer.setup{}

-- Load utility functions
-- require('utils.helpers')

