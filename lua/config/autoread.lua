vim.opt.autoread = true

local group = vim.api.nvim_create_augroup("AutoReloadExternalChanges", { clear = true })

local function checktime()
  if vim.fn.getcmdwintype() == "" then
    vim.cmd("silent! checktime")
  end
end

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "TermLeave" }, {
  group = group,
  callback = checktime,
})

local timer = vim.uv.new_timer()

timer:start(1000, 1000, vim.schedule_wrap(checktime))

vim.api.nvim_create_autocmd("VimLeavePre", {
  group = group,
  once = true,
  callback = function()
    timer:stop()
    timer:close()
  end,
})
