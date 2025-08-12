-- bootstrap lazy.nvim, LazyVim and your plugins

-- 加载LazyVim配置
require("config.lazy")

-- 加载VSCode配置
require("config.vscode")

-- - "t" -- 不根据 textwidth 自动换行
-- - "o" -- 不自动插入注释

-- 自动进入目录
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- 自动进入目录
    local path = vim.fn.argv()[1]
    if path and vim.fn.isdirectory(path) == 1 then
      vim.cmd("cd " .. path)
    end

    -- 禁用窗口自动跳转
    vim.cmd([[
      nnoremap <silent> <Esc> <Esc>
      vnoremap <silent> <Esc> <Esc>
      inoremap <silent> <Esc> <Esc>
    ]])
  end,
})

