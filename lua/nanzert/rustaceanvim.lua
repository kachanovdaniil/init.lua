local function on_attach(client, bufnr)
    require("nanzert.lsp.handlers").on_attach(client, bufnr)
end

vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
        float_win_config = {
            border = "none",
        }
    },
    -- LSP configuration
    server = {
        on_attach = on_attach,
        default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
            },
        },
    },
    -- DAP configuration
    dap = {
    },
}
