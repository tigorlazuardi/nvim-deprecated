-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/tigor/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/tigor/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/tigor/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/tigor/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tigor/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["completion-buffers"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/completion-buffers"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  edge = {
    config = { "\27LJ\1\2E\0\0\2\0\4\0\0064\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\1G\0\1\0\21colorscheme edge\17nvim_command\bapi\bvim\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/edge"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\1\2·\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\t\0\0\21--stdin-filepath\0\19--single-quote\14--no-semi\21--trailing-comma\ball\16--tab-width\0064\1\0\2\nstdin\2\bexe\rprettier·\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\t\0\0\21--stdin-filepath\0\19--single-quote\14--no-semi\21--trailing-comma\ball\16--tab-width\0064\1\0\2\nstdin\2\bexe\rprettier·\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\t\0\0\21--stdin-filepath\0\19--single-quote\14--no-semi\21--trailing-comma\ball\16--tab-width\0064\1\0\2\nstdin\2\bexe\rprettier·\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\t\0\0\21--stdin-filepath\0\19--single-quote\14--no-semi\21--trailing-comma\ball\16--tab-width\0064\1\0\2\nstdin\2\bexe\rprettierD\0\0\2\0\3\0\0043\0\0\0003\1\1\0:\1\2\0H\0\2\0\targs\1\2\0\0\18--emit=stdout\1\0\2\nstdin\2\bexe\frustfmtk\0\0\2\0\3\0\0043\0\0\0003\1\1\0:\1\2\0H\0\2\0\targs\1\3\0\0#--single-quote-to-double-quote\23--column-limit=120\1\0\2\nstdin\2\bexe\15lua-format&\0\0\1\0\1\0\0023\0\0\0H\0\2\0\1\0\2\bexe\rbeautysh\nstdin\1&\0\0\1\0\1\0\0023\0\0\0H\0\2\0\1\0\2\bexe\rbeautysh\nstdin\1ç\3\1\0\5\0\25\0-4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0002\3\3\0001\4\4\0;\4\1\3:\3\6\0022\3\3\0001\4\a\0;\4\1\3:\3\b\0022\3\3\0001\4\t\0;\4\1\3:\3\n\0022\3\3\0001\4\v\0;\4\1\3:\3\f\0022\3\3\0001\4\r\0;\4\1\3:\3\14\0022\3\3\0001\4\15\0;\4\1\3:\3\16\0022\3\3\0001\4\17\0;\4\1\3:\3\18\0022\3\3\0001\4\19\0;\4\1\3:\3\20\2:\2\21\1>\0\2\0014\0\22\0007\0\23\0%\1\24\0>\0\2\1G\0\1\0©\1        augroup FormatAutogroup\n          autocmd!\n          autocmd BufWritePost *.js,*.rs,*.lua,*.ts,*.tsx,*.jsx,*.sh,*.zsh*, FormatWrite\n        augroup END\n    \bcmd\bvim\rfiletype\bzsh\0\ash\0\blua\0\trust\0\15javascript\0\20javascriptreact\0\20typescriptreact\0\15typescript\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\2\20\0\0\1\0\1\0\2%\0\0\0H\0\2\0\tâ–Š Î\3\0\0\4\1$\0J3\0\1\0+\1\0\0007\1\0\1:\1\2\0+\1\0\0007\1\3\1:\1\4\0+\1\0\0007\1\5\1:\1\6\0+\1\0\0007\1\5\1:\1\a\0+\1\0\0007\1\5\1:\1\b\0+\1\0\0007\1\t\1:\1\n\0+\1\0\0007\1\0\1:\1\v\0+\1\0\0007\1\f\1:\1\r\0+\1\0\0007\1\f\1:\1\14\0+\1\0\0007\1\f\1:\1\15\0+\1\0\0007\1\16\1:\1\17\0+\1\0\0007\1\18\1:\1\19\0+\1\0\0007\1\18\1:\1\20\0+\1\0\0007\1\0\1:\1\21\0+\1\0\0007\1\0\1:\1\22\0+\1\0\0007\1\23\1:\1\24\0+\1\0\0007\1\23\1:\1\25\0+\1\0\0007\1\23\1:\1\26\0+\1\0\0007\1\0\1:\1\27\0+\1\0\0007\1\0\1:\1\28\0004\1\29\0007\1\30\0017\1\31\1%\2 \0004\3\29\0007\3!\0037\3\"\3>\3\1\0026\3\3\0$\2\3\2>\1\2\1%\1#\0H\1\2\0\1À\nïŒŒ  \tmode\afn\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\bredS\0\0\2\0\4\0\v3\0\0\0004\1\1\0007\1\2\0017\1\3\0016\1\1\0\15\0\1\0T\2\2€)\1\1\0H\1\2\0)\1\2\0H\1\2\0\rfiletype\abo\bvim\1\0\2\5\2\14dashboard\2\21\0\0\1\0\1\0\2%\0\0\0H\0\2\0\n ï‘¿ \20\0\0\1\0\1\0\2%\0\0\0H\0\2\0\t â–Šó\21\1\0\n\0z\0Ç\0024\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\0014\2\0\0%\3\4\0>\2\2\0027\3\5\0003\4\a\0:\4\6\0007\4\b\0033\5\15\0003\6\n\0001\a\t\0:\a\v\0062\a\3\0007\b\f\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6\16\5;\5\1\0047\4\b\0033\5\21\0003\6\18\0001\a\17\0:\a\v\0063\a\20\0007\b\19\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6\22\5;\5\2\0047\4\b\0033\5\27\0003\6\23\0007\a\24\2:\a\25\0062\a\3\0007\b\26\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6\28\5;\5\3\0047\4\b\0033\5 \0003\6\29\0007\a\24\2:\a\25\0062\a\3\0004\b\0\0%\t\30\0>\b\2\0027\b\31\b;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6!\5;\5\4\0047\4\b\0033\5%\0003\6\"\0007\a\24\2:\a\25\0063\a$\0007\b#\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6&\5;\5\5\0047\4\b\0033\5*\0003\6'\0003\a(\0007\b\r\1;\b\2\a:\a)\0062\a\3\0007\b\26\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6+\5;\5\6\0047\4\b\0033\5/\0003\6,\0003\a-\0007\b\r\1;\b\2\a:\a)\0063\a.\0007\b\26\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\0060\5;\5\a\0047\4\b\0033\0052\0003\0061\0002\a\3\0007\b\19\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\0063\5;\5\b\0047\4\b\0033\0056\0003\0064\0002\a\3\0007\b5\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\0067\5;\5\t\0047\4\b\0033\5:\0003\0068\0002\a\3\0007\b9\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6;\5;\5\n\0047\4\b\0033\5=\0003\6<\0002\a\3\0007\b\f\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6>\5;\5\v\0047\4?\0033\5C\0003\6@\0001\aA\0:\a\25\0063\aB\0007\b9\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6D\5;\5\1\0047\4E\0033\5K\0003\6F\0007\aG\2:\a\25\0063\aH\0007\b\r\1;\b\2\a:\a)\0063\aJ\0007\bI\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6L\5;\5\1\0047\4E\0033\5P\0003\6M\0007\aG\2:\a\25\0063\aN\0007\b\r\1;\b\2\a:\a)\0063\aO\0007\bI\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6Q\5;\5\2\0047\4E\0033\5X\0003\6S\0001\aR\0:\a\v\0067\aT\2:\a\25\0063\aU\0007\b\r\1;\b\2\a:\a)\0063\aW\0007\bV\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6Y\5;\5\3\0047\4E\0033\5\\\0003\6Z\0007\aT\2:\a\25\0063\a[\0007\bV\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6]\5;\5\4\0047\4E\0033\5_\0003\6^\0007\aG\2:\a\25\0062\a\3\0007\bI\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6`\5;\5\5\0047\4E\0033\5c\0003\6a\0007\aG\2:\a\25\0062\a\3\0007\bb\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6d\5;\5\6\0047\4E\0033\5f\0003\6e\0007\aG\2:\a\25\0062\a\3\0007\b\19\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6g\5;\5\a\0047\4E\0033\5j\0003\6i\0001\ah\0:\a\v\0062\a\3\0007\b\f\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6k\5;\5\b\0047\4l\0033\5p\0003\6m\0003\an\0007\b\r\1;\b\2\a:\a)\0063\ao\0007\b\f\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6q\5;\5\1\0047\4l\0033\5t\0003\6r\0007\a\24\2:\a\25\0063\as\0007\b\26\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6u\5;\5\2\0047\4v\0033\5x\0003\6w\0002\a\3\0007\b\26\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6y\5;\5\1\0040\0\0€G\0\1\0\15BufferIcon\1\0\0\1\0\1\rprovider\15BufferIcon\21short_line_right\14SFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14SFileName\15BufferType\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\17FileTypeName\20short_line_left\16RainbowBlue\1\0\0\1\0\0\0\15DiffRemove\1\0\0\1\0\2\ticon\n ï…† \rprovider\15DiffRemove\17DiffModified\1\0\0\vorange\1\0\2\ticon\t ï§‰\rprovider\17DiffModified\fDiffAdd\1\0\0\1\0\2\ticon\n ïƒ¾ \rprovider\fDiffAdd\14GitBranch\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14GitBranch\fGitIcon\1\0\0\1\4\0\0\0\0\tbold\vviolet\1\2\0\0\tNONE\24check_git_workspace\1\0\1\14separator\6 \0\15FileFormat\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\15FileFormat\15FileEncode\1\0\0\1\4\0\0\0\0\tbold\ngreen\1\2\0\0\tNONE\18hide_in_width\1\0\2\14separator\6 \rprovider\15FileEncode\nright\18ShowLspClient\1\0\0\1\4\0\0\0\0\tbold\0\1\0\2\ticon\rï‚… LSP:\rprovider\17GetLspClient\bmid\19DiagnosticInfo\1\0\0\1\0\2\ticon\n ïš \rprovider\19DiagnosticInfo\19DiagnosticHint\1\0\0\tcyan\1\0\2\ticon\n ïª \rprovider\19DiagnosticHint\19DiagnosticWarn\1\0\0\vyellow\1\0\2\ticon\n ï± \rprovider\19DiagnosticWarn\20DiagnosticError\1\0\0\1\0\2\ticon\n ï— \rprovider\20DiagnosticError\fPerCent\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\16LinePercent\rLineInfo\1\0\0\24separator_highlight\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\15LineColumn\rFileName\1\0\0\1\4\0\0\0\0\tbold\fmagenta\1\0\1\rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color!galaxyline.provider_fileinfo\1\0\1\rprovider\rFileIcon\rFileSize\1\0\0\afg\14condition\21buffer_not_empty\1\0\1\rprovider\rFileSize\vViMode\1\0\0\1\4\0\0\0\0\tbold\bred\1\0\0\0\15RainbowRed\1\0\0\14highlight\abg\tblue\rprovider\1\0\0\0\tleft\1\5\0\0\rNvimTree\nvista\tdbui\vpacker\20short_line_list\fsection\25galaxyline.condition\fdefault\21galaxyline.theme\15galaxyline\frequire\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2ä\f\0\0\4\0\24\0\0274\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\0013\2\16\0003\3\17\0:\3\18\0023\3\19\0:\3\20\2:\2\21\0013\2\22\0:\2\23\1>\0\2\1G\0\1\0\16watch_index\1\0\2\rinterval\3è\a\17follow_files\2\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\f\fnoremap\2\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\vbuffer\2\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\n\20update_debounce\3d\29current_line_blame_delay\3ô\3\vlinehl\1\23use_decoration_api\2\22use_internal_diff\2\nnumhl\1\18sign_priority\3\6\23current_line_blame\2 current_line_blame_position\beol\14word_diff\1\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ€¾\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ”‚\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\1\2P\0\0\2\1\4\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1+\0\0\0>\0\1\1G\0\1\0\0À\1\0\1\17max_line_len\3x\nsetup\ago\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/opt/go.nvim"
  },
  kommentary = {
    config = { "\27LJ\1\2|\0\0\3\0\5\0\b4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0003\2\4\0>\0\3\1G\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lua-dev.nvim"] = {
    config = { "\27LJ\1\2A\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_option\bapi\bvimŸ\16\1\2\v\0C\0£\0013\2\5\0002\3\3\0003\4\1\0003\5\0\0:\5\2\4;\4\1\0033\4\4\0003\5\3\0:\5\2\4;\4\2\3:\3\6\0022\3\3\0003\4\b\0003\5\a\0:\5\2\0043\5\t\0:\5\n\4;\4\1\3:\3\v\0022\3\3\0003\4\r\0003\5\f\0:\5\2\4;\4\1\3:\3\14\0024\3\15\0%\4\16\0>\3\2\0027\3\17\0033\4\19\0003\5\18\0:\5\20\4:\2\21\4>\3\2\0014\3\15\0%\4\22\0>\3\2\0027\3\17\3>\3\1\0011\3\23\0001\4\24\0\16\5\4\0%\6\25\0%\a\26\0>\5\3\0013\5\27\0\16\6\3\0%\a\28\0%\b\29\0%\t\30\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b\31\0%\t \0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b!\0%\t\"\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b#\0%\t$\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b%\0%\t&\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b'\0%\t(\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b)\0%\t*\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b+\0%\t,\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b-\0%\t.\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b/\0%\t0\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b1\0%\t2\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b3\0%\t4\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b5\0%\t6\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b7\0%\t8\0\16\n\5\0>\6\5\0017\0069\0007\6:\6\15\0\6\0T\a\a€\16\6\3\0%\a\28\0%\b;\0%\t<\0\16\n\5\0>\6\5\1T\6\n€7\0069\0007\6=\6\15\0\6\0T\a\6€\16\6\3\0%\a\28\0%\b;\0%\t<\0\16\n\5\0>\6\5\0017\0069\0007\6>\6\15\0\6\0T\a\6€4\6?\0007\6@\0067\6A\6%\aB\0)\b\1\0>\6\3\0010\0\0€G\0\1\0ö\1        augroup lsp_document_highlight\n            autocmd!\n            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n        augroup END\n        \14nvim_exec\bapi\bvim\23document_highlight\30document_range_formatting*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f\24document_formatting\26resolved_capabilities2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\14<leader>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<leader>d*<cmd>lua vim.lsp.buf.references()<CR>\agr&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\14<leader>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\15<leader>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\15<leader>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\15<leader>wa.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0\18lsp_signature\24chain_complete_list\27matching_strategy_list\1\0\0\1\4\0\0\nexact\14substring\nfuzzy\14on_attach\15completion\frequire\fcomment\1\0\0\1\3\0\0\tpath\fbuffers\vstring\19triggered_only\1\2\0\0\6/\1\0\0\1\2\0\0\tpath\fdefault\1\0\0\1\0\0\1\3\0\0\tpath\fbuffers\19complete_items\1\0\0\1\3\0\0\blsp\fsnippetÛ\1\1\0\5\0\r\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0007\0\3\0004\1\0\0%\2\4\0>\1\2\0027\1\3\0013\2\6\0003\3\5\0:\3\a\0023\3\t\0003\4\b\0:\4\n\0031\4\v\0:\4\f\3:\3\1\2>\1\2\0=\0\0\1G\0\1\0\14on_attach\0\bcmd\1\0\0\1\2\0\0\24lua-language-server\flibrary\1\0\0\1\0\3\fplugins\2\ntypes\2\15vimruntime\2\flua-dev\nsetup\16sumneko_lua\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\1\2A\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_option\bapi\bvimŸ\16\1\2\v\0C\0£\0013\2\5\0002\3\3\0003\4\1\0003\5\0\0:\5\2\4;\4\1\0033\4\4\0003\5\3\0:\5\2\4;\4\2\3:\3\6\0022\3\3\0003\4\b\0003\5\a\0:\5\2\0043\5\t\0:\5\n\4;\4\1\3:\3\v\0022\3\3\0003\4\r\0003\5\f\0:\5\2\4;\4\1\3:\3\14\0024\3\15\0%\4\16\0>\3\2\0027\3\17\0033\4\19\0003\5\18\0:\5\20\4:\2\21\4>\3\2\0014\3\15\0%\4\22\0>\3\2\0027\3\17\3>\3\1\0011\3\23\0001\4\24\0\16\5\4\0%\6\25\0%\a\26\0>\5\3\0013\5\27\0\16\6\3\0%\a\28\0%\b\29\0%\t\30\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b\31\0%\t \0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b!\0%\t\"\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b#\0%\t$\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b%\0%\t&\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b'\0%\t(\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b)\0%\t*\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b+\0%\t,\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b-\0%\t.\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b/\0%\t0\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b1\0%\t2\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b3\0%\t4\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b5\0%\t6\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b7\0%\t8\0\16\n\5\0>\6\5\0017\0069\0007\6:\6\15\0\6\0T\a\a€\16\6\3\0%\a\28\0%\b;\0%\t<\0\16\n\5\0>\6\5\1T\6\n€7\0069\0007\6=\6\15\0\6\0T\a\6€\16\6\3\0%\a\28\0%\b;\0%\t<\0\16\n\5\0>\6\5\0017\0069\0007\6>\6\15\0\6\0T\a\6€4\6?\0007\6@\0067\6A\6%\aB\0)\b\1\0>\6\3\0010\0\0€G\0\1\0ö\1        augroup lsp_document_highlight\n            autocmd!\n            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n        augroup END\n        \14nvim_exec\bapi\bvim\23document_highlight\30document_range_formatting*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f\24document_formatting\26resolved_capabilities2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\14<leader>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<leader>d*<cmd>lua vim.lsp.buf.references()<CR>\agr&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\14<leader>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\15<leader>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\15<leader>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\15<leader>wa.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0\18lsp_signature\24chain_complete_list\27matching_strategy_list\1\0\0\1\4\0\0\nexact\14substring\nfuzzy\14on_attach\15completion\frequire\fcomment\1\0\0\1\3\0\0\tpath\fbuffers\vstring\19triggered_only\1\2\0\0\6/\1\0\0\1\2\0\0\tpath\fdefault\1\0\0\1\0\0\1\3\0\0\tpath\fbuffers\19complete_items\1\0\0\1\3\0\0\blsp\fsnippetã\1\0\0\t\1\n\0\0284\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\1\0>\0\2\0027\0\3\0>\0\1\0024\1\4\0\16\2\0\0>\1\2\4D\4\v€4\6\0\0%\a\5\0>\6\2\0026\6\5\0067\6\2\0063\a\6\0+\b\0\0:\b\a\a3\b\b\0:\b\t\a>\6\2\1B\4\3\3N\4óG\0\1\0\0À\nflags\1\0\1\26debounce_text_changes\3–\1\14on_attach\1\0\0\14lspconfig\npairs\22installed_servers\nsetup\15lspinstall\frequire5\0\0\2\1\3\0\a+\0\0\0>\0\1\0014\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\1À\fbufdo e\bcmd\bvim[\1\0\4\0\6\0\v1\0\0\0001\1\1\0\16\2\1\0>\2\1\0014\2\2\0%\3\3\0>\2\2\0021\3\5\0:\3\4\0020\0\0€G\0\1\0\0\22post_install_hook\15lspinstall\frequire\0\0\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-lsputils"] = {
    config = { "\27LJ\1\2¾\5\0\0\3\0\23\0A4\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\5\0>\1\2\0027\1\6\1:\1\3\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\b\0>\1\2\0027\1\t\1:\1\a\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\b\0>\1\2\0027\1\v\1:\1\n\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\b\0>\1\2\0027\1\r\1:\1\f\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\b\0>\1\2\0027\1\15\1:\1\14\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\b\0>\1\2\0027\1\17\1:\1\16\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\19\0>\1\2\0027\1\20\1:\1\18\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\19\0>\1\2\0027\1\22\1:\1\21\0G\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\1\2…\1\0\1\2\0\6\1\0187\1\0\0\a\1\1\0T\1\3€'\1\15\0H\1\2\0T\1\v€7\1\0\0\a\1\2\0T\1\6€4\1\3\0007\1\4\0017\1\5\1\22\1\0\1H\1\2\0T\1\2€'\1\20\0H\1\2\0G\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµæÌ™\19™³æþ\3$\0\0\2\1\1\0\5+\0\0\0\16\1\0\0007\0\0\0>\0\2\1G\0\1\0\1À\vtoggleê\3\1\0\a\0\20\0\0304\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0001\2\3\0:\2\5\0012\2\0\0:\2\6\1>\0\2\0014\0\0\0%\1\a\0>\0\2\0027\0\b\0\16\2\0\0007\1\t\0003\3\n\0>\1\3\0021\2\v\0005\2\f\0004\2\r\0007\2\14\0027\2\15\2%\3\16\0%\4\17\0%\5\18\0003\6\19\0>\2\5\0010\0\0€G\0\1\0\1\0\2\vsilent\2\fnoremap\2#<cmd>lua _lazygit_toggle()<CR>\14<leader>g\6n\20nvim_set_keymap\bapi\bvim\20_lazygit_toggle\0\1\0\2\bcmd\flazygit\vhidden\2\bnew\rTerminal\24toggleterm.terminal\20shade_filetypes\tsize\1\0\t\20shade_terminals\2\17open_mapping\n<c-\\>\19shading_factor\r<number>\17persist_size\2\14direction\nfloat\18close_on_exit\2\20start_in_insert\2\20insert_mappings\2\17hide_numbers\2\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { '\27LJ\1\2§\2\0\0\6\0\f\0"3\0\0\0004\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\5\0%\4\6\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\a\0%\4\6\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\b\0%\4\t\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\n\0%\4\v\0\16\5\0\0>\1\5\1G\0\1\0\26:NvimTreeFindFile<CR>\15<leader>tn\25:NvimTreeRefresh<CR>\15<leader>tr\15<leader>tt\24:NvimTreeToggle<CR>\14<leader>e\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\0' },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\1\2ê\5\0\0\5\0\30\0!4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\28\0003\2\6\0003\3\3\0003\4\4\0:\4\5\3:\3\a\0023\3\b\0003\4\t\0:\4\n\0033\4\v\0:\4\f\3:\3\r\0023\3\14\0003\4\15\0:\4\16\0033\4\17\0:\4\18\0033\4\19\0:\4\20\0033\4\21\0:\4\22\3:\3\23\0023\3\24\0003\4\25\0:\4\26\3:\3\27\2:\2\29\1>\0\2\1G\0\1\0\16textobjects\1\0\0\16lsp_interop\25peek_definition_code\1\0\2\adf\20@function.outer\adF\17@class.outer\1\0\2\vborder\tnone\venable\2\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\14set_jumps\2\venable\2\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\1\0\2\14lookahead\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["snippets.nvim"] = {
    config = { '\27LJ\1\2‘\1\0\0\2\0\6\0\n4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0%\1\5\0>\0\2\1G\0\1\0006let g:completion_enable_snippet = "snippets.nvim"\bcmd\bvim\27use_suggested_mappings\rsnippets\frequire\0' },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2À\3\0\0\6\0\r\0\"3\0\0\0004\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\5\0%\4\6\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\a\0%\4\b\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\t\0%\4\n\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\v\0%\4\f\0\16\5\0\0>\1\5\1G\0\1\0:<cmd>lua require('telescope.builtin').help_tags()<cr>\15<leader>fh8<cmd>lua require('telescope.builtin').buffers()<cr>\15<leader>fb:<cmd>lua require('telescope.builtin').live_grep()<cr>\15<leader>fg;<cmd>lua require('telescope.builtin').find_files()<cr>\15<leader>ff\6n\20nvim_set_keymap\bapi\bvim\1\0\2\fnoremap\2\vsilent\2\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2‡\1\0\0\2\0\6\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\0014\0\3\0007\0\4\0%\1\5\0>\0\2\1G\0\1\0004nnoremap <silent> <leader>td :TodoTelescope<CR>\bcmd\bvim\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  vim = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/vim"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/vim-textobj-entire"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-textobj-variable-segment"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/vim-textobj-variable-segment"
  },
  ["vim-textobj-xmlattr"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/vim-textobj-xmlattr"
  },
  ["wildfire.vim"] = {
    loaded = true,
    path = "/home/tigor/.local/share/nvim/site/pack/packer/start/wildfire.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\1\2·\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\t\0\0\21--stdin-filepath\0\19--single-quote\14--no-semi\21--trailing-comma\ball\16--tab-width\0064\1\0\2\nstdin\2\bexe\rprettier·\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\t\0\0\21--stdin-filepath\0\19--single-quote\14--no-semi\21--trailing-comma\ball\16--tab-width\0064\1\0\2\nstdin\2\bexe\rprettier·\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\t\0\0\21--stdin-filepath\0\19--single-quote\14--no-semi\21--trailing-comma\ball\16--tab-width\0064\1\0\2\nstdin\2\bexe\rprettier·\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\t\0\0\21--stdin-filepath\0\19--single-quote\14--no-semi\21--trailing-comma\ball\16--tab-width\0064\1\0\2\nstdin\2\bexe\rprettierD\0\0\2\0\3\0\0043\0\0\0003\1\1\0:\1\2\0H\0\2\0\targs\1\2\0\0\18--emit=stdout\1\0\2\nstdin\2\bexe\frustfmtk\0\0\2\0\3\0\0043\0\0\0003\1\1\0:\1\2\0H\0\2\0\targs\1\3\0\0#--single-quote-to-double-quote\23--column-limit=120\1\0\2\nstdin\2\bexe\15lua-format&\0\0\1\0\1\0\0023\0\0\0H\0\2\0\1\0\2\bexe\rbeautysh\nstdin\1&\0\0\1\0\1\0\0023\0\0\0H\0\2\0\1\0\2\bexe\rbeautysh\nstdin\1ç\3\1\0\5\0\25\0-4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0002\3\3\0001\4\4\0;\4\1\3:\3\6\0022\3\3\0001\4\a\0;\4\1\3:\3\b\0022\3\3\0001\4\t\0;\4\1\3:\3\n\0022\3\3\0001\4\v\0;\4\1\3:\3\f\0022\3\3\0001\4\r\0;\4\1\3:\3\14\0022\3\3\0001\4\15\0;\4\1\3:\3\16\0022\3\3\0001\4\17\0;\4\1\3:\3\18\0022\3\3\0001\4\19\0;\4\1\3:\3\20\2:\2\21\1>\0\2\0014\0\22\0007\0\23\0%\1\24\0>\0\2\1G\0\1\0©\1        augroup FormatAutogroup\n          autocmd!\n          autocmd BufWritePost *.js,*.rs,*.lua,*.ts,*.tsx,*.jsx,*.sh,*.zsh*, FormatWrite\n        augroup END\n    \bcmd\bvim\rfiletype\bzsh\0\ash\0\blua\0\trust\0\15javascript\0\20javascriptreact\0\20typescriptreact\0\15typescript\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2À\3\0\0\6\0\r\0\"3\0\0\0004\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\5\0%\4\6\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\a\0%\4\b\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\t\0%\4\n\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\v\0%\4\f\0\16\5\0\0>\1\5\1G\0\1\0:<cmd>lua require('telescope.builtin').help_tags()<cr>\15<leader>fh8<cmd>lua require('telescope.builtin').buffers()<cr>\15<leader>fb:<cmd>lua require('telescope.builtin').live_grep()<cr>\15<leader>fg;<cmd>lua require('telescope.builtin').find_files()<cr>\15<leader>ff\6n\20nvim_set_keymap\bapi\bvim\1\0\2\fnoremap\2\vsilent\2\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring('\27LJ\1\2§\2\0\0\6\0\f\0"3\0\0\0004\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\5\0%\4\6\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\a\0%\4\6\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\b\0%\4\t\0\16\5\0\0>\1\5\0014\1\1\0007\1\2\0017\1\3\1%\2\4\0%\3\n\0%\4\v\0\16\5\0\0>\1\5\1G\0\1\0\26:NvimTreeFindFile<CR>\15<leader>tn\25:NvimTreeRefresh<CR>\15<leader>tr\15<leader>tt\24:NvimTreeToggle<CR>\14<leader>e\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\0', "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\1\2\20\0\0\1\0\1\0\2%\0\0\0H\0\2\0\tâ–Š Î\3\0\0\4\1$\0J3\0\1\0+\1\0\0007\1\0\1:\1\2\0+\1\0\0007\1\3\1:\1\4\0+\1\0\0007\1\5\1:\1\6\0+\1\0\0007\1\5\1:\1\a\0+\1\0\0007\1\5\1:\1\b\0+\1\0\0007\1\t\1:\1\n\0+\1\0\0007\1\0\1:\1\v\0+\1\0\0007\1\f\1:\1\r\0+\1\0\0007\1\f\1:\1\14\0+\1\0\0007\1\f\1:\1\15\0+\1\0\0007\1\16\1:\1\17\0+\1\0\0007\1\18\1:\1\19\0+\1\0\0007\1\18\1:\1\20\0+\1\0\0007\1\0\1:\1\21\0+\1\0\0007\1\0\1:\1\22\0+\1\0\0007\1\23\1:\1\24\0+\1\0\0007\1\23\1:\1\25\0+\1\0\0007\1\23\1:\1\26\0+\1\0\0007\1\0\1:\1\27\0+\1\0\0007\1\0\1:\1\28\0004\1\29\0007\1\30\0017\1\31\1%\2 \0004\3\29\0007\3!\0037\3\"\3>\3\1\0026\3\3\0$\2\3\2>\1\2\1%\1#\0H\1\2\0\1À\nïŒŒ  \tmode\afn\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\bredS\0\0\2\0\4\0\v3\0\0\0004\1\1\0007\1\2\0017\1\3\0016\1\1\0\15\0\1\0T\2\2€)\1\1\0H\1\2\0)\1\2\0H\1\2\0\rfiletype\abo\bvim\1\0\2\5\2\14dashboard\2\21\0\0\1\0\1\0\2%\0\0\0H\0\2\0\n ï‘¿ \20\0\0\1\0\1\0\2%\0\0\0H\0\2\0\t â–Šó\21\1\0\n\0z\0Ç\0024\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\0014\2\0\0%\3\4\0>\2\2\0027\3\5\0003\4\a\0:\4\6\0007\4\b\0033\5\15\0003\6\n\0001\a\t\0:\a\v\0062\a\3\0007\b\f\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6\16\5;\5\1\0047\4\b\0033\5\21\0003\6\18\0001\a\17\0:\a\v\0063\a\20\0007\b\19\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6\22\5;\5\2\0047\4\b\0033\5\27\0003\6\23\0007\a\24\2:\a\25\0062\a\3\0007\b\26\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6\28\5;\5\3\0047\4\b\0033\5 \0003\6\29\0007\a\24\2:\a\25\0062\a\3\0004\b\0\0%\t\30\0>\b\2\0027\b\31\b;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6!\5;\5\4\0047\4\b\0033\5%\0003\6\"\0007\a\24\2:\a\25\0063\a$\0007\b#\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6&\5;\5\5\0047\4\b\0033\5*\0003\6'\0003\a(\0007\b\r\1;\b\2\a:\a)\0062\a\3\0007\b\26\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6+\5;\5\6\0047\4\b\0033\5/\0003\6,\0003\a-\0007\b\r\1;\b\2\a:\a)\0063\a.\0007\b\26\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\0060\5;\5\a\0047\4\b\0033\0052\0003\0061\0002\a\3\0007\b\19\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\0063\5;\5\b\0047\4\b\0033\0056\0003\0064\0002\a\3\0007\b5\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\0067\5;\5\t\0047\4\b\0033\5:\0003\0068\0002\a\3\0007\b9\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6;\5;\5\n\0047\4\b\0033\5=\0003\6<\0002\a\3\0007\b\f\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6>\5;\5\v\0047\4?\0033\5C\0003\6@\0001\aA\0:\a\25\0063\aB\0007\b9\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6D\5;\5\1\0047\4E\0033\5K\0003\6F\0007\aG\2:\a\25\0063\aH\0007\b\r\1;\b\2\a:\a)\0063\aJ\0007\bI\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6L\5;\5\1\0047\4E\0033\5P\0003\6M\0007\aG\2:\a\25\0063\aN\0007\b\r\1;\b\2\a:\a)\0063\aO\0007\bI\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6Q\5;\5\2\0047\4E\0033\5X\0003\6S\0001\aR\0:\a\v\0067\aT\2:\a\25\0063\aU\0007\b\r\1;\b\2\a:\a)\0063\aW\0007\bV\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6Y\5;\5\3\0047\4E\0033\5\\\0003\6Z\0007\aT\2:\a\25\0063\a[\0007\bV\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6]\5;\5\4\0047\4E\0033\5_\0003\6^\0007\aG\2:\a\25\0062\a\3\0007\bI\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6`\5;\5\5\0047\4E\0033\5c\0003\6a\0007\aG\2:\a\25\0062\a\3\0007\bb\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6d\5;\5\6\0047\4E\0033\5f\0003\6e\0007\aG\2:\a\25\0062\a\3\0007\b\19\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6g\5;\5\a\0047\4E\0033\5j\0003\6i\0001\ah\0:\a\v\0062\a\3\0007\b\f\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6k\5;\5\b\0047\4l\0033\5p\0003\6m\0003\an\0007\b\r\1;\b\2\a:\a)\0063\ao\0007\b\f\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6q\5;\5\1\0047\4l\0033\5t\0003\6r\0007\a\24\2:\a\25\0063\as\0007\b\26\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6u\5;\5\2\0047\4v\0033\5x\0003\6w\0002\a\3\0007\b\26\1;\b\1\a7\b\r\1;\b\2\a:\a\14\6:\6y\5;\5\1\0040\0\0€G\0\1\0\15BufferIcon\1\0\0\1\0\1\rprovider\15BufferIcon\21short_line_right\14SFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14SFileName\15BufferType\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\17FileTypeName\20short_line_left\16RainbowBlue\1\0\0\1\0\0\0\15DiffRemove\1\0\0\1\0\2\ticon\n ï…† \rprovider\15DiffRemove\17DiffModified\1\0\0\vorange\1\0\2\ticon\t ï§‰\rprovider\17DiffModified\fDiffAdd\1\0\0\1\0\2\ticon\n ïƒ¾ \rprovider\fDiffAdd\14GitBranch\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14GitBranch\fGitIcon\1\0\0\1\4\0\0\0\0\tbold\vviolet\1\2\0\0\tNONE\24check_git_workspace\1\0\1\14separator\6 \0\15FileFormat\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\15FileFormat\15FileEncode\1\0\0\1\4\0\0\0\0\tbold\ngreen\1\2\0\0\tNONE\18hide_in_width\1\0\2\14separator\6 \rprovider\15FileEncode\nright\18ShowLspClient\1\0\0\1\4\0\0\0\0\tbold\0\1\0\2\ticon\rï‚… LSP:\rprovider\17GetLspClient\bmid\19DiagnosticInfo\1\0\0\1\0\2\ticon\n ïš \rprovider\19DiagnosticInfo\19DiagnosticHint\1\0\0\tcyan\1\0\2\ticon\n ïª \rprovider\19DiagnosticHint\19DiagnosticWarn\1\0\0\vyellow\1\0\2\ticon\n ï± \rprovider\19DiagnosticWarn\20DiagnosticError\1\0\0\1\0\2\ticon\n ï— \rprovider\20DiagnosticError\fPerCent\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\16LinePercent\rLineInfo\1\0\0\24separator_highlight\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\15LineColumn\rFileName\1\0\0\1\4\0\0\0\0\tbold\fmagenta\1\0\1\rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color!galaxyline.provider_fileinfo\1\0\1\rprovider\rFileIcon\rFileSize\1\0\0\afg\14condition\21buffer_not_empty\1\0\1\rprovider\rFileSize\vViMode\1\0\0\1\4\0\0\0\0\tbold\bred\1\0\0\0\15RainbowRed\1\0\0\14highlight\abg\tblue\rprovider\1\0\0\0\tleft\1\5\0\0\rNvimTree\nvista\tdbui\vpacker\20short_line_list\fsection\25galaxyline.condition\fdefault\21galaxyline.theme\15galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\1\2…\1\0\1\2\0\6\1\0187\1\0\0\a\1\1\0T\1\3€'\1\15\0H\1\2\0T\1\v€7\1\0\0\a\1\2\0T\1\6€4\1\3\0007\1\4\0017\1\5\1\22\1\0\1H\1\2\0T\1\2€'\1\20\0H\1\2\0G\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµæÌ™\19™³æþ\3$\0\0\2\1\1\0\5+\0\0\0\16\1\0\0007\0\0\0>\0\2\1G\0\1\0\1À\vtoggleê\3\1\0\a\0\20\0\0304\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0001\2\3\0:\2\5\0012\2\0\0:\2\6\1>\0\2\0014\0\0\0%\1\a\0>\0\2\0027\0\b\0\16\2\0\0007\1\t\0003\3\n\0>\1\3\0021\2\v\0005\2\f\0004\2\r\0007\2\14\0027\2\15\2%\3\16\0%\4\17\0%\5\18\0003\6\19\0>\2\5\0010\0\0€G\0\1\0\1\0\2\vsilent\2\fnoremap\2#<cmd>lua _lazygit_toggle()<CR>\14<leader>g\6n\20nvim_set_keymap\bapi\bvim\20_lazygit_toggle\0\1\0\2\bcmd\flazygit\vhidden\2\bnew\rTerminal\24toggleterm.terminal\20shade_filetypes\tsize\1\0\t\20shade_terminals\2\17open_mapping\n<c-\\>\19shading_factor\r<number>\17persist_size\2\14direction\nfloat\18close_on_exit\2\20start_in_insert\2\20insert_mappings\2\17hide_numbers\2\0\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: nvim-lsputils
time([[Config for nvim-lsputils]], true)
try_loadstring("\27LJ\1\2¾\5\0\0\3\0\23\0A4\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\5\0>\1\2\0027\1\6\1:\1\3\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\b\0>\1\2\0027\1\t\1:\1\a\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\b\0>\1\2\0027\1\v\1:\1\n\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\b\0>\1\2\0027\1\r\1:\1\f\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\b\0>\1\2\0027\1\15\1:\1\14\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\b\0>\1\2\0027\1\17\1:\1\16\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\19\0>\1\2\0027\1\20\1:\1\18\0004\0\0\0007\0\1\0007\0\2\0004\1\4\0%\2\19\0>\1\2\0027\1\22\1:\1\21\0G\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0", "config", "nvim-lsputils")
time([[Config for nvim-lsputils]], false)
-- Config for: snippets.nvim
time([[Config for snippets.nvim]], true)
try_loadstring('\27LJ\1\2‘\1\0\0\2\0\6\0\n4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0%\1\5\0>\0\2\1G\0\1\0006let g:completion_enable_snippet = "snippets.nvim"\bcmd\bvim\27use_suggested_mappings\rsnippets\frequire\0', "config", "snippets.nvim")
time([[Config for snippets.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\1\2‡\1\0\0\2\0\6\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\0014\0\3\0007\0\4\0%\1\5\0>\0\2\1G\0\1\0004nnoremap <silent> <leader>td :TodoTelescope<CR>\bcmd\bvim\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: lua-dev.nvim
time([[Config for lua-dev.nvim]], true)
try_loadstring("\27LJ\1\2A\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_option\bapi\bvimŸ\16\1\2\v\0C\0£\0013\2\5\0002\3\3\0003\4\1\0003\5\0\0:\5\2\4;\4\1\0033\4\4\0003\5\3\0:\5\2\4;\4\2\3:\3\6\0022\3\3\0003\4\b\0003\5\a\0:\5\2\0043\5\t\0:\5\n\4;\4\1\3:\3\v\0022\3\3\0003\4\r\0003\5\f\0:\5\2\4;\4\1\3:\3\14\0024\3\15\0%\4\16\0>\3\2\0027\3\17\0033\4\19\0003\5\18\0:\5\20\4:\2\21\4>\3\2\0014\3\15\0%\4\22\0>\3\2\0027\3\17\3>\3\1\0011\3\23\0001\4\24\0\16\5\4\0%\6\25\0%\a\26\0>\5\3\0013\5\27\0\16\6\3\0%\a\28\0%\b\29\0%\t\30\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b\31\0%\t \0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b!\0%\t\"\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b#\0%\t$\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b%\0%\t&\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b'\0%\t(\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b)\0%\t*\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b+\0%\t,\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b-\0%\t.\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b/\0%\t0\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b1\0%\t2\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b3\0%\t4\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b5\0%\t6\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b7\0%\t8\0\16\n\5\0>\6\5\0017\0069\0007\6:\6\15\0\6\0T\a\a€\16\6\3\0%\a\28\0%\b;\0%\t<\0\16\n\5\0>\6\5\1T\6\n€7\0069\0007\6=\6\15\0\6\0T\a\6€\16\6\3\0%\a\28\0%\b;\0%\t<\0\16\n\5\0>\6\5\0017\0069\0007\6>\6\15\0\6\0T\a\6€4\6?\0007\6@\0067\6A\6%\aB\0)\b\1\0>\6\3\0010\0\0€G\0\1\0ö\1        augroup lsp_document_highlight\n            autocmd!\n            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n        augroup END\n        \14nvim_exec\bapi\bvim\23document_highlight\30document_range_formatting*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f\24document_formatting\26resolved_capabilities2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\14<leader>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<leader>d*<cmd>lua vim.lsp.buf.references()<CR>\agr&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\14<leader>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\15<leader>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\15<leader>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\15<leader>wa.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0\18lsp_signature\24chain_complete_list\27matching_strategy_list\1\0\0\1\4\0\0\nexact\14substring\nfuzzy\14on_attach\15completion\frequire\fcomment\1\0\0\1\3\0\0\tpath\fbuffers\vstring\19triggered_only\1\2\0\0\6/\1\0\0\1\2\0\0\tpath\fdefault\1\0\0\1\0\0\1\3\0\0\tpath\fbuffers\19complete_items\1\0\0\1\3\0\0\blsp\fsnippetÛ\1\1\0\5\0\r\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0007\0\3\0004\1\0\0%\2\4\0>\1\2\0027\1\3\0013\2\6\0003\3\5\0:\3\a\0023\3\t\0003\4\b\0:\4\n\0031\4\v\0:\4\f\3:\3\1\2>\1\2\0=\0\0\1G\0\1\0\14on_attach\0\bcmd\1\0\0\1\2\0\0\24lua-language-server\flibrary\1\0\0\1\0\3\fplugins\2\ntypes\2\15vimruntime\2\flua-dev\nsetup\16sumneko_lua\14lspconfig\frequire\0", "config", "lua-dev.nvim")
time([[Config for lua-dev.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2ä\f\0\0\4\0\24\0\0274\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\0013\2\16\0003\3\17\0:\3\18\0023\3\19\0:\3\20\2:\2\21\0013\2\22\0:\2\23\1>\0\2\1G\0\1\0\16watch_index\1\0\2\rinterval\3è\a\17follow_files\2\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\f\fnoremap\2\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\vbuffer\2\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\n\20update_debounce\3d\29current_line_blame_delay\3ô\3\vlinehl\1\23use_decoration_api\2\22use_internal_diff\2\nnumhl\1\18sign_priority\3\6\23current_line_blame\2 current_line_blame_position\beol\14word_diff\1\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ€¾\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ”‚\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: edge
time([[Config for edge]], true)
try_loadstring("\27LJ\1\2E\0\0\2\0\4\0\0064\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\1G\0\1\0\21colorscheme edge\17nvim_command\bapi\bvim\0", "config", "edge")
time([[Config for edge]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\1\2|\0\0\3\0\5\0\b4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0003\2\4\0>\0\3\1G\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\1\2ê\5\0\0\5\0\30\0!4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\28\0003\2\6\0003\3\3\0003\4\4\0:\4\5\3:\3\a\0023\3\b\0003\4\t\0:\4\n\0033\4\v\0:\4\f\3:\3\r\0023\3\14\0003\4\15\0:\4\16\0033\4\17\0:\4\18\0033\4\19\0:\4\20\0033\4\21\0:\4\22\3:\3\23\0023\3\24\0003\4\25\0:\4\26\3:\3\27\2:\2\29\1>\0\2\1G\0\1\0\16textobjects\1\0\0\16lsp_interop\25peek_definition_code\1\0\2\adf\20@function.outer\adF\17@class.outer\1\0\2\vborder\tnone\venable\2\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\14set_jumps\2\venable\2\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\1\0\2\14lookahead\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-lspinstall
time([[Config for nvim-lspinstall]], true)
try_loadstring("\27LJ\1\2A\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_option\bapi\bvimŸ\16\1\2\v\0C\0£\0013\2\5\0002\3\3\0003\4\1\0003\5\0\0:\5\2\4;\4\1\0033\4\4\0003\5\3\0:\5\2\4;\4\2\3:\3\6\0022\3\3\0003\4\b\0003\5\a\0:\5\2\0043\5\t\0:\5\n\4;\4\1\3:\3\v\0022\3\3\0003\4\r\0003\5\f\0:\5\2\4;\4\1\3:\3\14\0024\3\15\0%\4\16\0>\3\2\0027\3\17\0033\4\19\0003\5\18\0:\5\20\4:\2\21\4>\3\2\0014\3\15\0%\4\22\0>\3\2\0027\3\17\3>\3\1\0011\3\23\0001\4\24\0\16\5\4\0%\6\25\0%\a\26\0>\5\3\0013\5\27\0\16\6\3\0%\a\28\0%\b\29\0%\t\30\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b\31\0%\t \0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b!\0%\t\"\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b#\0%\t$\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b%\0%\t&\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b'\0%\t(\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b)\0%\t*\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b+\0%\t,\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b-\0%\t.\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b/\0%\t0\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b1\0%\t2\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b3\0%\t4\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b5\0%\t6\0\16\n\5\0>\6\5\1\16\6\3\0%\a\28\0%\b7\0%\t8\0\16\n\5\0>\6\5\0017\0069\0007\6:\6\15\0\6\0T\a\a€\16\6\3\0%\a\28\0%\b;\0%\t<\0\16\n\5\0>\6\5\1T\6\n€7\0069\0007\6=\6\15\0\6\0T\a\6€\16\6\3\0%\a\28\0%\b;\0%\t<\0\16\n\5\0>\6\5\0017\0069\0007\6>\6\15\0\6\0T\a\6€4\6?\0007\6@\0067\6A\6%\aB\0)\b\1\0>\6\3\0010\0\0€G\0\1\0ö\1        augroup lsp_document_highlight\n            autocmd!\n            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n        augroup END\n        \14nvim_exec\bapi\bvim\23document_highlight\30document_range_formatting*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f\24document_formatting\26resolved_capabilities2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\14<leader>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<leader>d*<cmd>lua vim.lsp.buf.references()<CR>\agr&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\14<leader>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\15<leader>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\15<leader>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\15<leader>wa.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0\18lsp_signature\24chain_complete_list\27matching_strategy_list\1\0\0\1\4\0\0\nexact\14substring\nfuzzy\14on_attach\15completion\frequire\fcomment\1\0\0\1\3\0\0\tpath\fbuffers\vstring\19triggered_only\1\2\0\0\6/\1\0\0\1\2\0\0\tpath\fdefault\1\0\0\1\0\0\1\3\0\0\tpath\fbuffers\19complete_items\1\0\0\1\3\0\0\blsp\fsnippetã\1\0\0\t\1\n\0\0284\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\1\0>\0\2\0027\0\3\0>\0\1\0024\1\4\0\16\2\0\0>\1\2\4D\4\v€4\6\0\0%\a\5\0>\6\2\0026\6\5\0067\6\2\0063\a\6\0+\b\0\0:\b\a\a3\b\b\0:\b\t\a>\6\2\1B\4\3\3N\4óG\0\1\0\0À\nflags\1\0\1\26debounce_text_changes\3–\1\14on_attach\1\0\0\14lspconfig\npairs\22installed_servers\nsetup\15lspinstall\frequire5\0\0\2\1\3\0\a+\0\0\0>\0\1\0014\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\1À\fbufdo e\bcmd\bvim[\1\0\4\0\6\0\v1\0\0\0001\1\1\0\16\2\1\0>\2\1\0014\2\2\0%\3\3\0>\2\2\0021\3\5\0:\3\4\0020\0\0€G\0\1\0\0\22post_install_hook\15lspinstall\frequire\0\0\0", "config", "nvim-lspinstall")
time([[Config for nvim-lspinstall]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
