return {
  "folke/flash.nvim",
  opts = {
    dim = false,
    highlight = {
      matches = { fg = "#000000", bg = "#CCFF88", bold = true },
      backdrop = false,
    },
    modes = {
      char = {
        highlight = {
          backdrop = false,
        },
        label = {
          position = "before",
        },
      },
    },
  },
}
-- return {
--   "folke/flash.nvim",
--   config = function()
--     -- 设置 FlashMatch 高亮组的颜色
--     vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#000000", bg = "#CCFF88", bold = true })
--
--     require("flash").setup({
--       dim = false,
--       highlight = {
--         matches = true, -- 确保开启匹配项高亮
--         backdrop = false,
--       },
--       modes = {
--         char = {
--           label = { enabled = false }, -- 关闭默认标签
--           highlight = {
--             matches = function(match)
--               -- 手动高亮目标字符，位置可完全自定义
--               vim.api.nvim_buf_add_highlight(
--                 0,
--                 match.ns,
--                 "FlashMatch",
--                 match.pos[1] - 1,
--                 match.pos[2],
--                 match.pos[2] + 1
--               )
--             end,
--           },
--         },
--       },
--     })
--   end,
-- }
