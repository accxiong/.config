-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local path = vim.fn.argv()[1]
    if path and vim.fn.isdirectory(path) == 1 then
      vim.cmd("cd " .. path)
    end
  end,
})
