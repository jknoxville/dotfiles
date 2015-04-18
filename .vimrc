" Enable syntax highlighting
syntax on

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Allow writing after opening without sudo
cmap w!! w !sudo tee > /dev/null %

