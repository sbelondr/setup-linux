"* ************************************************************************** *"
"*                                                                            *"
"*                                                        :::      ::::::::   *"
"*   .vimrc                                             :+:      :+:    :+:   *"
"*                                                    +:+ +:+         +:+     *"
"*   By: sbelondr <sbelondr@student.42.fr>          +#+  +:+       +#+        *"
"*                                                +#+#+#+#+#+   +#+           *"
"*   Created: 2020-03-26 18:43:19 by sbelondr          #+#    #+#             *"
"*   Updated: 2020-03-26 18:43:19 by sbelondr         ###   ########.fr       *"
"*                                                                            *"
"* ************************************************************************** *"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
""""""""""""""""""""""""""""""""" initialize """""""""""""""""""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

execute pathogen#infect()

syntax	on
set		mouse-=a
set		nu
set		ruler
set		colorcolumn=80

"	tab settings
"set expandtab
"set		tabstop=2
"set		softtabstop=2
"set		shiftwidth=2
set		autoindent
set		smartindent
set		cindent


"	Search ctags for c file
filetype on
filetype detect

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""" function """"""""""""""""""""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

function InitializeC()
	let		current_folder = getcwd()
	silent exec "!ctags -R " . current_folder

	let g:syntastic_c_include_dirs = ['libft/includes', 'includes']
	let g:syntastic_c_compiler_options = "-Wall -Wextra -Werror"
	let g:syntastic_c_check_header = 1
	let g:syntastic_c_remove_include_errors = 1
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	let g:syntastic_error_symbol = "✗"
endfunction

function GetNormi()
	let file_name=expand('%:p')
	return system("norminette " . file_name)
endfunction

"	Norminette
function Normi()
	set statusline=
	echo GetNormi()
endfunction

" Create header 42
function Headerfile()
	let name=expand('%:p')
	let lnum=len(name)
	let finalWhite = 82 - lnum - 6 - 25
	let finalW = ""

	while finalWhite > 0
		let finalW = finalW . " "
		let finalWhite = finalWhite - 1
	endwhile

	:0r /home/samuel/.vim/config_perso/header_noremap.txt
	exe "1," . 10 . 's/\/\*   <file>.*/\/\*   ' .name . finalW . ':+:      :+:    :+:   \*\//'
	exe "1," . 10 . "g/<date> <hour>/s//" .strftime("%Y-%m-%d %H:%M:%S")
	execute '%s/<user>/' . $USER_42 . '/g'
	exe "1," . 10 . "g/Updated:.*/s/Updated:.*/Updated: " .strftime("%Y-%m-%d %H:%M:%S") ." by " . $USER_42 . "         ###   ########.fr       \*\\/ "
	:$
endfunction

function NewTab()
	:tabnew
	:Explore
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"""""""""""""""""""""""""""""" initialize theme """"""""""""""""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

if &ft == "c" || &ft == "cpp"
	:call InitializeC()
endif

"	apply theme gruvbox
filetype plugin indent on
let	g:airline_theme='gruvbox'
let	g:gruvbox_color_column='bg1'
let	g:gruvbox_vert_split='gray'
colorscheme	gruvbox
set termguicolors
set background=dark
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark='medium'

"	format date/time
let	g:airline#extensions#clock#format = '%d/%m %H:%M'
let g:airline#extensions#clock#updatetime = 1000

" option search
set ignorecase
set smartcase
set	hlsearch
hi	Search ctermbg=White
hi	Search ctermfg=Blue

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" For mac
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
	let g:clang_library_path=s:clang_library_path
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
""""""""""""""""""""""""""""""""" key binding """"""""""""""""""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" resize window
nnoremap <F2> :vertical resize -1<CR>
nnoremap <F3> :vertical resize +1<CR>
nnoremap <F4> :resize +1<CR>
nnoremap <F5> :resize -1<CR>


"	Nerdtree
noremap <F12> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"	see invisible characters
set		listchars=eol:$,tab:→\ ,trail:.,space:·,extends:>,precedes:<,nbsp:_
noremap <S-F5> :set list!<CR>
inoremap <S-F5> <C-o>:set list!<CR>
cnoremap <S-F5> <C-c>:set list!<CR>

" call function to create 42 header
"nnoremap <C-F5> :call Headerfile()<CR>

nnoremap <F6> :set relativenumber<CR>
nnoremap <S-F6> :set norelativenumber<CR>

" call norminette
noremap <F7> :call Normi()<CR>

noremap <S-F8> :%!xxd<CR>


nnoremap <F9> :call NewTab()<CR>
nnoremap <S-F9> :tabnew<CR>
nnoremap <F10> gt<CR>
nnoremap <S-F10> gT<CR>

"	Comment line
map cl 0i//<Esc>
map ucl 02x


" switch
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" Ctrl-m for make
" nnoremap <C-M> :make<CR>
