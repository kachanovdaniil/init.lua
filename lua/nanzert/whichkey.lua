local wk = require("which-key")

local setup = {
}

local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local mappings = {
    f = { require("telescope.builtin").find_files, "Find files" },
    F = { require("telescope.builtin").live_grep, "Find text" },
    b = { require("telescope.builtin").buffers, "Find buffers" },
    l = {
        name = "LSP",
        f = { function() vim.lsp.buf.format { async = true } end, "Format" },
        a = { vim.lsp.buf.code_action, "Code actiond" },
        q = { vim.diagnostic.setloclist, "Local quickfix" },
        Q = { vim.diagnostic.setqflist, "Quickfix" },
        r = { vim.lsp.buf.rename, "Rename" },
        h = { function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = nil })) end, "Inlay hints" },
    },
	h = {
		name = "Harpoon",
		a = { require('harpoon.mark').add_file, "Add File" },
		c = { require('harpoon.ui').toggle_quick_menu, "Quick Menu" },
        j = { function() require('harpoon.ui').nav_file(1) end, "Next File" },
        k = { function() require('harpoon.ui').nav_file(-1) end, "Prev File" },
	},
    hl = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["/"] = { require("Comment.api").toggle.linewise.current, "Comment" },
}

local vopts = {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local vmappings = {
    ["/"] = { '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>', "Comment" },
}

wk.setup(setup)
wk.register(mappings, opts)
wk.register(vmappings, vopts)
