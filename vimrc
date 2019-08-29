execute pathogen#infect()

syntax	on
set		mouse-=a
set		nu
set		ruler
set		colorcolumn=80

"	tab settings
" set expandtab
"set		tabstop=2
"set		softtabstop=2
"set		shiftwidth=2
"set		autoindent
"set		smartindent
"set		cindent

"	see invisible characters
set		listchars=eol:$,tab:→\ ,trail:.,space:·,extends:>,precedes:<,nbsp:_
noremap <F6> :set list!<CR>
inoremap <F6> <C-o>:set list!<CR>
cnoremap <F6> <C-c>:set list!<CR>

"	Comment line
map cl 0i//<Esc>
map ucl 02x

"	Search ctags for c file
filetype on
filetype detect
if &ft == "c" 
	let		current_folder = getcwd()
	silent exec "!ctags -R " . current_folder
endif

"	apply theme gruvbox
filetype plugin indent on
let	g:airline_theme='gruvbox'
let	g:gruvbox_color_column='bg1'
let	g:gruvbox_vert_split='gray'
colorscheme	gruvbox
"set background=dark

"	
let	g:airline#extensions#clock#format = '%d/%m %H:%M'
let g:airline#extensions#clock#updatetime = 1000

set ignorecase
set smartcase
set	hlsearch
hi	Search ctermbg=White
hi	Search ctermfg=Blue

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_c_include_dirs = ['libft/includes', 'includes']
let g:syntastic_c_compiler_options = "-Wall -Wextra -Werror"
let g:syntastic_c_check_header = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"

"	Nerdtree
noremap <C-g> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function GetNormi()
	let file_name=expand('%:p')
	return system("norminette " . file_name)
endfunction

"	Norminette
function Normi()
	set statusline=
	echo GetNormi()
"	execute \":R norminette \" . file_name
endfunction

noremap <F5> :call Normi()<CR>
"command! -nargs=* -complete=shellcmd R | set splitbelow | new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
	    let g:clang_library_path=s:clang_library_path
endif


" edit bind window
nnoremap <F2> :vertical resize +1<CR>
nnoremap <F3> :vertical resize -1<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-M> :make<CR>

"set termguicolors
"set background=dark
"let g:gruvbox_termcolors=16
"let g:gruvbox_contrast_dark='medium'
