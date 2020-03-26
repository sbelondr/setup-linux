# Vim

Configuration of my vim

## Dependency

- [Pathogen](https://github.com/tpope/vim-pathogen)

- [Gruvbox](https://github.com/morhetz/gruvbox)

- [Ariline](https://github.com/vim-airline/vim-airline)

- [Syntastic](https://github.com/vim-syntastic/syntastic)

- [NerdTree](https://github.com/scrooloose/nerdtree)

- [Clang-complete](https://github.com/xavierd/clang_complete)

- [Norminette](https://github.com/Gegel85/norminette) *(untested and optional)*

- Install ctags to navigate between function (only for C and optional)

- copy vimrc to ~/.vimrc

## 42 header

This header is automatically displayed for C and C++ file languages or use the keybinding.

Add `export USER_42=<user>` in your .bashrc or .zshrc file then `source ~/<your_file>`.

`mkdir -p config_perso` and copy `header.txt` in `~/.vim/config_perso/header_noremap.txt`

## Keybinding

**Remember to deactivate the shortcut F1 on the terminal if assigned**

| Key      | Action
|----------|--------------------------------------------|
| `F1`     | Increase vertical size.                    |
| `F2`     | Decrease vertical size.                    |
| `F3`     | Increase horizontal size.                  |
| `F4`     | Decrease horizontal size.                  |
| `F5`     | Display directory.                         |
| `F6`     | Visualize invisible characters.            |
| `F7`     | Call norminette.                           |
| `F8`     | Include header file.                       |
| `cl`     | Comment line.                              |
| `ucl`    | Decomment line.                            |
