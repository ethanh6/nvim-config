local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  vim.notify("Nvim-autopairs not working")
  return
end

npairs.setup {
  enable_check_bracket_line = false,
  disable_filetype = { "TelescopePrompt" },
  check_ts = true,
}

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
