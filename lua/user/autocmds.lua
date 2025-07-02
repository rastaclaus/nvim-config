-- Wrap and check for spell in text filetypes.
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('wrap_spell', { clear = true }),
    pattern = { 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = false
		vim.opt_local.textwidth = 120
    end,
})
