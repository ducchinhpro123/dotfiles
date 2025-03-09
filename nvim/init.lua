-- Load performance settings first for maximum effect
require('core.performance')

-- Load core settings
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Load plugins
require('plugins.init')

-- The plugin configurations are now loaded through the use{} blocks in plugins/init.lua
-- No need for separate requires here

