local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd [[:set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz]]

keymap("n", "Ж", "<cmd>silent exec '!qdbus org.kde.keyboard /Layouts setLayout 0'<cr>:", { noremap = true })

-- Insert --
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Debug --
-- Debug mode
-- Debug --
--
dap = require('dap')
dapui = require('dapui')

function toggle_breakpoint()
  dap.toggle_breakpoint()
end

keymap("n", "<leader>o", "<cmd>lua dapui.open()<CR>", opts)

keymap("n", "<leader>c", "<cmd>lua dapui.close()<CR>", opts)

keymap("n", "<leader>B", "<cmd>lua toggle_breakpoint()<CR>", opts)

keymap("n", "<leader>H>", "<cmd>lua dap.continue()<CR>", opts)

keymap("n", "<leader>j", "<cmd>lua dap.step_over()<CR>", opts)

keymap("n", "<leader>k", "<cmd>lua dap.step_into()<CR>", opts)

keymap("n", "<leader>H", "<cmd>lua dap.continue()<CR>", opts)

keymap("n", "<leader>S", '<cmd> lua dap.terminate()<CR>', opts)

keymap("n", "<leader>R", '<cmd> lua dap.restart()<CR>', opts)

keymap("n", "<leader>L", '<cmd> lua dap.run_last()<CR>', opts)

--


-- Terminal --
-- Exit terminal
keymap("t", "kjf", "<c-bslash><c-n>", {})
