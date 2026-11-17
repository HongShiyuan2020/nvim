-- Remove Global Default Key mapping
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")



-- Create keymapping

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show current lsp error float pannel.' })


-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        local keymap = vim.keymap
        local lsp = vim.lsp
	    local bufopts = { noremap = true, silent = true }

        keymap.set("n", "gr", lsp.buf.references, bufopts)
        keymap.set("n", "gd", lsp.buf.definition, bufopts)
        keymap.set("n", "<space>rn", lsp.buf.rename, bufopts)
        keymap.set("n", "K", lsp.buf.hover, bufopts)
        keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts)
        keymap.set({"n", "v"}, "<leader>ca", lsp.buf.code_action, bufopts)
    end
})



vim.lsp.enable({ "pyright", "lua_ls", "ruff", "clangd", "rust-analyzer", "yamlls"})
