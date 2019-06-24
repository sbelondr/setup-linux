execute pathogen#infect()

syntax	on
set	mouse-=a
set	nu
set	ruler
set	colorcolumn=80
set	expandtab
set	shiftwidth=4
set	autoindent
set	smartindent
set	cindent


filetype plugin indent on

" appliquer theme Gruvbox
let g:airline_theme='gruvbox'
let g:airline#extensions#whitespace#mixed_indent_algo=1
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#show_tab_nr=0
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#tabline#exclude_preview=1
let g:airline#extensions#tabline#fnamecollapse=1
let g:airline#extensions#tabline#fnamemod=':~:.'
let g:airline#extensions#tabline#buffers_label='buffers'
let g:airline#extensions#tabline#tabs_label='tabs'
let g:airline#extensions#tabline#overflow_marker='…'
let g:airline_section_z='%3p%% %3l:%-2v'

let	g:gruvbox_color_column='bg1'
let	g:gruvbox_vert_split='gray'
colorscheme	gruvbox
set termguicolors
set background=dark
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark='medium'
"
" " afficher l'heure en bas a droite
"let g:airline#extensions#clock#format = '%d/%m %H:%M'
"let g:airline#extensions#clock#updatetime = 1000
"
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
