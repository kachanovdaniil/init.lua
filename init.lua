require "nanzert.plugins"
require "nanzert.keymaps"
require "nanzert.options"
require "nanzert.telescope"
require "nanzert.whichkey"
require "nanzert.cmp"
require "nanzert.lsp"
require "nanzert.colorscheme"
require "nanzert.treesitter"
require "nanzert.illuminate"
require "nanzert.autopairs"
require "nanzert.rustaceanvim"
require "nanzert.copilot"
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
require("dap-python").setup("python")
require('dap-python').test_runner = 'pytest'
local dapui = require('dapui')

-- Настройка nvim-dap-ui (если требуется)
dapui.setup()

require('dap-python').test_runner = 'pytest'
