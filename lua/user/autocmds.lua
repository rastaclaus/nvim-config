-- Wrap and check for spell in text filetypes.
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = false
		vim.opt_local.textwidth = 120
	end,
})

-- Группа автокоманд
vim.api.nvim_create_augroup("auto_reload", { clear = true })

-- Проверять изменения при событиях
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = "auto_reload",
  pattern = "*",
  callback = function()
    vim.cmd("silent! checktime")
  end
})

-- Автоматическая перезагрузка при внешних изменениях
vim.api.nvim_create_autocmd("FileChangedShell", {
  group = "auto_reload",
  pattern = "*",
  callback = function()
    if vim.bo.modifiable and not vim.bo.modified then
      vim.cmd("edit!")
      vim.notify("File reloaded externally", vim.log.levels.WARN)
    end
  end
})
