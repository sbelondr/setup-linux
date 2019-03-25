execute pathogen#infect()

syntax	on
set		mouse-=a
set		nu
set		ruler
set		colorcolumn=80

filetype plugin indent on

" appliquer theme Gruvbox
let	g:airline_theme='gruvbox'
let	g:gruvbox_color_column='bg1'
let	g:gruvbox_vert_split='gray'
colorscheme	gruvbox
"set background=dark
"let g:gruvbox_termcolors=16
"let g:gruvbox_contrast_dark='medium'

" afficher l'heure en bas a droite
let	g:airline#extensions#clock#format = '%d/%m %H:%M'
let g:airline#extensions#clock#updatetime = 1000

" recherche
set	hlsearch
hi	Search ctermbg=White
hi	Search ctermfg=Blue

" verifier avec gcc et afficher sur une autre fenetre les erreurs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"

" test norminette
:let file_name=@%
execute "nnoremap <F5> :R norminette " . file_name . "<CR>"
:command! -nargs=* -complete=shellcmd R | set splitbelow | new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
