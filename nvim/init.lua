-- bootstrap lazy.nvim, LazyVim and your plugins

local is_vscode = vim.g.vscode

-- 加载LazyVim配置
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local path = vim.fn.argv()[1]
    if path and vim.fn.isdirectory(path) == 1 then
      vim.cmd("cd " .. path)
    end
  end,
})

-- VSCode环境的下划线修复
if is_vscode then
  -- 禁用诊断和清除下划线高亮
  vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter", "ColorScheme" }, {
    callback = function()
      vim.schedule(function()
        vim.diagnostic.disable()

        -- 清除下划线相关的高亮组
        local underline_groups = {
          "SpellBad",
          "SpellCap",
          "SpellLocal",
          "SpellRare",
          "DiagnosticUnderlineError",
          "DiagnosticUnderlineWarn",
          "DiagnosticUnderlineInfo",
          "DiagnosticUnderlineHint",
        }

        for _, group in ipairs(underline_groups) do
          vim.cmd("hi " .. group .. " gui=NONE cterm=NONE")
        end
      end)
    end,
  })

  -- 延迟处理LSP相关下划线
  vim.defer_fn(function()
    vim.diagnostic.disable()

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
          client.server_capabilities.documentHighlightProvider = false
        end
      end,
    })
  end, 1000)
else
  -- 终端环境：配置Neovim诊断显示
  vim.diagnostic.config({
    underline = false,
    virtual_text = {
      severity = { min = vim.diagnostic.severity.ERROR },
    },
    signs = true,
    float = {
      border = "rounded",
      header = "",
      prefix = "",
    },
  })
end
