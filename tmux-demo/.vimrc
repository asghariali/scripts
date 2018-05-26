syntax on
hi comment ctermfg=lightblue 
filetype plugin on

"""""""""""""" Map pour nouveaux scripts tmux--
" PageDown calls the 'runFromVim' for the current line only. Argument is PageDown which means no need to automatically wait on cursor as this is supposed to be controled by a human for each line. Why PageDown? that's what the remote control sends.
map <PageDown> :.w !~/.runFromVim.sh PageDown <CR>j:call system('tmux set-option status-right ' . expand('%:t') . ':' . line('.') . shellescape(' %H:%M') )<CR>z.
" I thin I mapped to F11 the same but with automatic wait. I don't use it
map      <F11> :.w !~/.runFromVim.sh F11      <CR>j:call system('tmux set-option status-right ' . expand('%:t') . ':' . line('.') . shellescape(' %H:%M') )<CR>z.
" F12 is to run from line 1 to current line
map       <F12> :call system('tmux set-option status-right ' . expand('%:t') . ':' . line('.') . shellescape(' %H:%M') )<CR>z.:1,.w !~/.runFromVim.sh F12
" Shift F12 runs the selected lines
map     <S-F12> :w !~/.runFromVim.sh S-F12 <CR>`>:call system('tmux set-option status-right ' . expand('%:t') . ':' . line('.') . shellescape(' %H:%M') )<CR><CR>^<CR>

"""""""""""""" Map pour anciens scripts tmux a commenter pour nouveaux scripts
"map <PageDown> :.w !grep ^tmux \| bash -x <CR><CR>/^tmux<CR>:noh<CR>mp :call system('tmux set-option status-right ' . expand('%:t') . ':' . line('.') . shellescape(' %H:%M') )<CR>z.






"map! <F5> :w:! sh %
"map <F5> :w:! sh %

"map <F9> !bash<CR>j

" execute:
map <F10> :1,.w !bash




" format sqlcl
map <F4> O<ESC>jyyp:s/[^ ]/-/g<CR>/SQL> select<CR>/;<CR>j^:noh<CR>z.

"map <S-PageDown> :.w !~/.runFromVim.sh %:t <CR>jz.
"map <C-PageDown> :.w !~/.runFromVim.sh %:t <CR>jz.


" ancien map <F12> :.,$w !bash<CR>G
" tmux
"


" map <S-F5> :!tmux resize-pane -Z<CR><CR>
" map <F5> :!tmux resize-pane -Z<CR><CR>


set mouse=n
" for mouse mode
"je sais pas -> je commente" map <RightMouse> :.w !grep ^tmux \| bash<CR><CR>/^tmux<CR>mp

" for ppt mode
"
"map <PageUp> :.w !grep ^tmux \| { tmux copy-mode ; tmux send-key "k?SQL>" c-M ; } <CR>
" xxx map <PageUp> :.w !grep ^tmux \| tmux select-pane -t :.-<CR><CR>
" S-F5 et F5 for zoom from remote

function CurrentLineToTmux()
 if match(getline('.'),"tmux")>=0 
  call system("echo " . substitute(getline('.'),"-- ","",""))
 else
  call system('tmux send-keys ' . shellescape(getline('.')))
 endif
endfunction


"map <S-F11> :call CurrentLineToTmux() <CR>

