return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    modes = {
      char = {
        enabled = false,
      },
    },
    -- 添加颜色覆盖配置
    highlight = {
      matches = true, -- 启用匹配高亮
      groups = {
        match = 'FlashMatch', -- 匹配项样式
        current = 'FlashCurrent', -- 当前项样式
        backdrop = 'FlashBackdrop',
      },
    },
  },
}
