-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del
local Util = require("lazyvim.util")

-- 将原有的 J/K 功能映射到 <leader>gj/<leader>gk
map("n", "<leader>gj", "J", { desc = "Join lines" })
map("v", "<leader>gj", "J", { desc = "Join selected lines" })
map("n", "<leader>gk", "K", { desc = "Keyword lookup" })

map('n', 'j', 'gj', { remap = true, desc = "Move down (skip folds)", silent = true })
map('n', 'k', 'gk', { remap = true, desc = "Move up (skip folds)", silent = true })

-- 跳到行首: Ctrl+a，跳到行尾: Ctrl+e 
-- VSCode 下修改 keybindings.json 添加如下配置
-- { "key": "ctrl+a", "command": "cursorHome", "when": "editorTextFocus" },
-- { "key": "ctrl+e", "command": "cursorEnd", "when": "editorTextFocus" },
map({"n", "x"}, "<C-a>", "^", { desc = "行首", noremap = true, silent = true })
map("i", "<C-a>", "<C-o>^", { desc = "insert 行首", noremap = true, silent = true })
map({"n", "x"}, "<C-e>", "$", { desc = "行尾", noremap = true, silent = true })
map("i", "<C-e>", "<C-o>$", { desc = "insert 行尾", noremap = true, silent = true })

-- neovim 窗口切换：使用 shift+方向键 替代 ctrl+h/l
if not vim.g.vscode then
map("n", "<S-Left>", "<C-w>h", { desc = "切换到左侧窗口", noremap = true, silent = true })
map("n", "<S-Right>", "<C-w>l", { desc = "切换到右侧窗口", noremap = true, silent = true })
map("n", "<S-Up>", "<C-w>k", { desc = "切换到上方窗口", noremap = true, silent = true })
map("n", "<S-Down>", "<C-w>j", { desc = "切换到下方窗口", noremap = true, silent = true })
end
-- vscode 窗口移动快捷键
if vim.g.vscode then
  -- map("n", "<S-Left>", "<cmd>lua require('vscode').call('workbench.action.navigateLeft')<CR>", { desc = "Window move left" })
  -- map("n", "<S-Right>", "<cmd>lua require('vscode').call('workbench.action.navigateRight')<CR>", { desc = "Window move right" })
  -- map("n", "<S-Up>", "<cmd>lua require('vscode').call('workbench.action.navigateUp')<CR>", { desc = "Window move up" })
  -- map("n", "<S-Down>", "<cmd>lua require('vscode').call('workbench.action.navigateDown')<CR>", { desc = "Window move down" })
  map("n", "<S-Left>", function()
    pcall(function()
      require('vscode').call('workbench.action.navigateLeft')
    end)
  end, { desc = "Window move left" })
  
  map("n", "<S-Right>", function()
    pcall(function()
      require('vscode').call('workbench.action.navigateRight')
    end)
  end, { desc = "Window move right" })
  
  map("n", "<S-Up>", function()
    pcall(function()
      require('vscode').call('workbench.action.navigateUp')
    end)
  end, { desc = "Window move up" })
  
  map("n", "<S-Down>", function()
    pcall(function()
      require('vscode').call('workbench.action.navigateDown')
    end)  
  end, { desc = "Window move down" })
end

-- 折叠相关
if vim.g.vscode then
  -- 使用 za 切换折叠，通过 VSCode 命令
  map("n", "za", "<cmd>lua require('vscode').call('editor.toggleFold')<CR>", { desc = "Toggle fold", noremap = true, silent = true })
  -- 添加其他折叠命令映射到 VSCode
  map("n", "zR", "<cmd>lua require('vscode').call('editor.unfoldAll')<CR>", { desc = "Unfold all", noremap = true, silent = true })
  map("n", "zM", "<cmd>lua require('vscode').call('editor.foldAll')<CR>", { desc = "Fold all", noremap = true, silent = true })
  map("n", "zo", "<cmd>lua require('vscode').call('editor.unfold')<CR>", { desc = "Unfold", noremap = true, silent = true })
  map("n", "zc", "<cmd>lua require('vscode').call('editor.fold')<CR>", { desc = "Fold", noremap = true, silent = true })
end

-- 重命名功能 
if vim.g.vscode then
map("n", "<leader>rn", "<cmd>lua require('vscode').call('editor.action.rename')<CR>", { desc = "Rename Symbol" })
end

-- 快速添加符号 
if vim.g.vscode then
  map("n", ";;", "A;<Esc>", { desc = "Add semicolon at end" })
  map("n", ",,", "A,<Esc>", { desc = "Add comma at end" })
  map("n", "''", "viw<Esc>a'<Esc>bi'<Esc>lel", { desc = "Surround word with single quotes" })
  map("n", "\"\"", "viw<Esc>a\"<Esc>bi\"<Esc>lel", { desc = "Surround word with double quotes" })
end

-- yazi 文件管理器
if vim.g.vscode then
  map({ "n", "x", "o" },'tt', "<cmd>lua require('vscode').call('yazi-vscode.toggle')<CR>", { noremap = true, silent = true })
end


-- VSCode 环境下禁用一些快捷键
if vim.g.vscode then
  -- 禁用 <leader>l (通常是 LazyVim 的 lazy.nvim 界面)
  pcall(function()
    unmap("n", "<leader>l")
  end)
  
  -- 禁用 <leader>L, 
  pcall(function()
    unmap("n", "<leader>L") -- 通常是 LspInfo
  end)
  
  -- 禁用 <leader>ff, 文件搜索
  pcall(function()
    unmap("n", "<leader>ff") 
  end)
  
  -- 禁用 <leader>e, 文件管理器
  pcall(function()
    unmap("n", "<leader>e") 
  end)
  
  -- 禁用 <leader>E, 文件管理器
  pcall(function()
    unmap("n", "<leader>E") 
  end)
  
  -- 如果需要禁用更多快捷键，可以继续添加：
  -- pcall(function()
  --   unmap("n", "<leader>xx") -- 替换为你想禁用的快捷键
  -- end)
end
