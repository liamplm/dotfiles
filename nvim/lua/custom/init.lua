-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.cmd [[
if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif
]]

vim.cmd [[
nmap <leader>cp :let @+ = expand("%:p")<cr>
]]

vim.cmd [[
" let g:tmux_navigator_no_mappings = 1
"
" noremap <silent> <M-Left> :<C-U>TmuxNavigateLeft<cr>
" noremap <silent> <M-Down> :<C-U>TmuxNavigateDown<cr>
" noremap <silent> <M-Up> :<C-U>TmuxNavigateUp<cr>
" noremap <silent> <M-Right> :<C-U>TmuxNavigateRight<cr>
" noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>

" if exists('$TMUX')
"   function! TmuxOrSplitSwitch(wincmd, tmuxdir)
"     let previous_winnr = winnr()
"     silent! execute "wincmd " . a:wincmd
"     if previous_winnr == winnr()
"       call system("tmux select-pane -" . a:tmuxdir)
"       redraw!
"     endif
"   endfunction
"
"   let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
"   let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
"   let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
"
"   nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
"   nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
"   nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
"   nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
" else
"   map <C-h> <C-w>h
"   map <C-j> <C-w>j
"   map <C-k> <C-w>k
"   map <C-l> <C-w>l
" endif

]]

local g = vim.g
local opt = vim.opt

-- g.loaded = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Do not change the fucking directory
opt.autochdir = false
-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.linebreak = false
opt.wrap = false

opt.ruler = true
opt.rnu = true

opt.backspace = "indent,eol,start"

-- Persian support
opt.termbidi = true

-- Folding
-- opt.foldmethod = "indent"
opt.foldmethod = "expr"
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false
opt.foldnestmax = 3

opt.clipboard = nil
-- opt.clipboard = "unnamed"
-- opt.clipboard = "unnamed,unnamedplus"
-- vim.cmd([[
--
-- let g:clipboard = {
--       \   'name': 'myClipboard',
--       \   'copy': {
--       \      '+': {lines, regtype -> extend(g:, {'foo': [lines, regtype]}) },
--       \      '*': {lines, regtype -> extend(g:, {'foo': [lines, regtype]}) },
--       \    },
--       \   'paste': {
--       \      '+': {-> get(g:, 'foo', [])},
--       \      '*': {-> get(g:, 'foo', [])},
--       \   },
--       \ }
--
-- ]])
--
-- vim.cmd[[
-- let g:clipboard = {
--       \   'name': 'myClipboard',
--       \   'copy': {
--       \      '+': ['xclip', '-sel', 'clip'],
--       \    },
--       \   'paste': {
--       \      '+': ['xclip', '-o'],
--       \   },
--       \   'cache_enabled': 1,
--       \ }
-- ]]
